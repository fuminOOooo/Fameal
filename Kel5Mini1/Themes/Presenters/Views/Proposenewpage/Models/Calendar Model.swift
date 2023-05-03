//
//  Calendar Model.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 02/05/23.
//

import Foundation
import Combine

class CalendarModel : ObservableObject {
    struct oneCalendar {
        var calendarName: String
        var calendarOwner: String
        var calendarMembers: [String]
    }
}
