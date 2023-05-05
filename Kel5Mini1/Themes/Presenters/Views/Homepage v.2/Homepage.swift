//
//  ContentView.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 19/04/23.
//

import SwiftUI
import EventKit

struct Homepage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var HpVM = HomepageViewModel()
    @ObservedObject var CcVM = calendarViewModel()
//    @Binding private var selectedCalendarID: String
    @State var selectedCalendar: EKCalendar?
    //    @State var selectedCalendarIndex: Int = 0
    @State private var calendars: [EKCalendar] = calendarViewModel().getUserCalendars()
    
    var body:some View {
//        NavigationView {
            VStack {
                HomePageHeader(selectedCalendar: self.$selectedCalendar)
                
                HomePageUpcomingEvent()
                
                HomePageProposedEvent(HpVM: HpVM)
                    .padding(.top)
                
                Spacer()
                
            }
            .padding(24)
//        }
        .navigationBarBackButtonHidden(true)
    }
}
