//
//  Proposenew Viewmodel.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import Combine
import EventKit

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
            self.calendars = self.eventStore.calendars(for: .event)
        }
    }
    
    func addCalendar(name: String) {
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                // Authorized access to the calendar
                let calendar = EKCalendar(for: .event, eventStore: self.eventStore)
                calendar.title = name
                
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
            return calendar.title.contains("(Fameal)")
        }
        print(filteredCalendars)
        return filteredCalendars
//        let sortedCalendars = filteredCalendars.sorted { $0.timeIntervalSince1970 > $1.timeIntervalSince1970 }
//        return sortedCalendars
    }
}
