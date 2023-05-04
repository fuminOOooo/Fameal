//
//  Proposenew Viewmodel.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import Combine

class HomepageViewModel: ObservableObject {
    
    @Published var currentCalendar: Int = 0
        
    @Published public var calendars: [CalendarModel.oneCalendar] = [
        CalendarModel.oneCalendar(calendarName: "Mitun's Family", calendarOwner: "Mitun", calendarMembers: ["Hai", "Halo", "hey"]),
        CalendarModel.oneCalendar(calendarName: "Dary's Family", calendarOwner: "Dary", calendarMembers: ["Hai", "Halo", "Hey", "fak"]),
        CalendarModel.oneCalendar(calendarName: "Elvis's Family", calendarOwner: "Elvis", calendarMembers: ["Hai", "Halo"])
    ]
    
    // For choosing which calendar should be selected
    @Published var calendarsAreShown: Bool = false
    
}
