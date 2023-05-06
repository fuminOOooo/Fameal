//
//  Proposenew Viewmodel.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import Combine
import EventKit
import MessageUI

class calendarViewModel: ObservableObject {
    private let eventStore = EKEventStore()
    @Published var calendars = [EKCalendar]()
    @Published var selectedCalendar: EKCalendar?
    //    var calendarNames: [String] = []
    
    init(){
        requestAccesstoCalendar()
    }
    
    func requestAccesstoCalendar(){
        eventStore.requestAccess(to: .event) { granted, error in
            guard granted else { return }
//            self.calendars = self.eventStore.calendars(for: .event)
        }
    }
    
    func addCalendar(name: String) {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                // Authorized access to the calendar
                let calendar = EKCalendar(for: .event, eventStore: self.eventStore)
                calendar.title = name
                calendar.allowsContentModifications
                
                // Find the iCloud source
                var iCloudSource: EKSource?
                for source in self.eventStore.sources {
                    if source.sourceType == .calDAV && source.title == "iCloud" {
                        iCloudSource = source
                        break
                    }
                }
                
                if let source = iCloudSource {
                    calendar.source = source
                    
                    do {
                        try self.eventStore.saveCalendar(calendar, commit: true)
                        print("Calendar saved successfully.")
                    } catch {
                        print("Error saving calendar: \(error.localizedDescription)")
                    }
                } else {
                    print("iCloud source not found.")
                }
            } else {
                print("Access to calendar not granted.")
            }
        }
    }
    
    func getUserCalendars() -> [EKCalendar] {
        let calendars = eventStore.calendars(for: .event)
        let filteredCalendars = calendars.filter { calendar in
            return calendar.title.contains("(Fameal) ")
        }
        print(filteredCalendars)
        return filteredCalendars
//        let sortedCalendars = filteredCalendars.sorted { $0.timeIntervalSince1970 > $1.timeIntervalSince1970 }
//        return sortedCalendars
    }
    
    func getCalendarIdentifier(forTitle title: String) -> String? {
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
        let filteredCalendars = calendars.filter { $0.title == title }
        if let calendar = filteredCalendars.first {
//            print (calendar.calendarIdentifier)
            return calendar.calendarIdentifier
        }
        return nil
    }
    
    func getCalendar(withIdentifier identifier: String) -> EKCalendar? {
        let eventStore = EKEventStore()
        return eventStore.calendar(withIdentifier: identifier)
    }
    
    func inviteToCalendar(calendar: EKCalendar, participants: [String], viewController: UIViewController) {
            // Check if the device is able to send email
            guard MFMailComposeViewController.canSendMail() else {
                print("Cannot send email")
                return
            }

            let mailController = MFMailComposeViewController()
            mailController.mailComposeDelegate = viewController as? MFMailComposeViewControllerDelegate
            
            // Set the subject and body of the email
            let subject = "Invitation to \(calendar.title)"
            let body = "You are invited to \(calendar.title) calendar. Please join by subscribing to the following URL: \(calendar.calendarIdentifier)"
            mailController.setSubject(subject)
            mailController.setMessageBody(body, isHTML: false)
            
            // Add the participants as recipients of the email
            mailController.setToRecipients(participants)
            
            // Present the mail view controller
            viewController.present(mailController, animated: true, completion: nil)
        }
}
