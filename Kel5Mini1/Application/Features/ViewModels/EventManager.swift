//
//  EventManager.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 06/05/23.
//

import Foundation
import EventKit

class EventManager: ObservableObject {
    
    @Published var eventStore = EKEventStore()
    /*
    func requestAccess(completion: @escaping (Bool) -> Void) {
        eventStore.requestAccess(to: .event) { granted, error in
            completion(granted)
        }
    }
     */
    
    func getSpecificCalendarEvents(from calendar: EKCalendar) -> [EKEvent] {
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)!
        let specificCalendar = eventStore.calendars(for: .event).first { $0.title == calendar.title }
        let predicate = eventStore.predicateForEvents (
            withStart: Date(), end: Date().addingTimeInterval(60*60*24*365), calendars: [specificCalendar!]
        )
        return eventStore.events(matching: predicate)
    }
    
    func getEvents() -> [EKEvent] {
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)!
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate, calendars:[self.eventStore.defaultCalendarForNewEvents!]
        )
        return eventStore.events(matching: predicate)
    }
    
    private func setTimeInDate(date: Date, time: Date) -> Date {
        let calendar = Calendar.current
        
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let timeComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: time)
        
        dateComponents.hour = timeComponents.hour
        dateComponents.minute = timeComponents.minute
        
        return calendar.date(from: dateComponents) ?? date
    }
    
    func addEvent(to calendar: EKCalendar, startDate: Date, startTime: Date, title: String, description: String) {
        let event = EKEvent(eventStore: eventStore)
        event.calendar = calendar
        event.title = title
        event.alarms = nil
        let startDateandTime = self.setTimeInDate(date: startDate, time: startTime)
        event.startDate = startDateandTime
        event.endDate = startDateandTime.addingTimeInterval(60 * 60) // 1 hour
        event.notes = description
        
        do {
            try eventStore.save(event, span: .thisEvent)
            print("Event saved to calendar!")
        } catch let error as NSError {
            print("Failed to save event with error: \(error.localizedDescription)")
        }
    }
    
    func deleteEvent(event: EKEvent) {
        do {
            try self.eventStore.remove(event, span: .thisEvent)
        } catch {
            print("Error deleting event: \(error.localizedDescription)")
        }
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM"
        return formatter.string(from: date)
    }
    func formattedTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm"
        return formatter.string(from: date)
    }
    
    
}
