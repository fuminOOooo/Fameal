//
//  Proposenew Viewmodel.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import Combine
import EventKit

class CreatecalendarViewModel: ObservableObject {
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
        eventStore.requestAccess(to: .event) { [self] granted, error in
            if granted {
                let newCalendar = EKCalendar(for: .event, eventStore: self.eventStore)
                newCalendar.title = name
                newCalendar.source = self.eventStore.defaultCalendarForNewEvents?.source
                do {
                    try self.eventStore.saveCalendar(newCalendar, commit: true)
                } catch let error {
                    print("Failed to save calendar: \(error.localizedDescription)")
                }
            } else {
                print("Access denied")
            }
        }
    }
    
    func getUserCalendars() -> [EKCalendar] {
        let calendars = eventStore.calendars(for: .event)
        let filteredCalendars = calendars.filter { calendar in
            return calendar.title.contains("(Fameal)")
        }
        return filteredCalendars
    }
}
