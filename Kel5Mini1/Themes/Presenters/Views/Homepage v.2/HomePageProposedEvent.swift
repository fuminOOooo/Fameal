//
//  Homepage2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 22/04/23.
//

import Foundation
import SwiftUI
import CoreData
import EventKit

struct HomePageProposedEvent: View {    
    @ObservedObject var EM = EventManager()
    @State var events = [EKEvent]()
    @Binding var selectedCalendar: EKCalendar?
    @ObservedObject var HpVM : HomepageViewModel
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    var body: some View {
        VStack{
            //upcoming navigation
            HStack{
                Text ("PROPOSED EVENT")
                    .font(Font.custom("Fredoka-Medium", size: 14))
                    .foregroundColor(Color("Gray3"))
                Spacer()
                if(!events.isEmpty){
                    NavigationLink {
                        Proposed(selectedCalendar: self.$selectedCalendar)
                    } label: {
                        Text ("See all")
                            .font(Font.custom("Fredoka", size: 16))
                            .foregroundColor(Color("Secondary"))
                    }
                }
            }
            .padding(.top)
            
            if(!events.isEmpty){
                VStack(alignment: .leading, spacing: 14){
                    HStack(){
                        //Content should be changeable
                        Text("Dary has invited you to join...")
                            .font(Font.custom("Fredoka-Regular", size: 14))
                            .foregroundColor(Color("PB-900"))
                    }
                    
                    HStack{
                        // "Monday, 17 Apr" SHOULD BE CHANGABLE
                        Text(EM.formattedDate(date: events[0].startDate))
                            .font(Font.custom("Fredoka-Medium", size: 20))
                            .foregroundColor(Color("Primary"))
                        
                        Image(systemName: "circle.fill")
                            .font(Font.custom("Fredoka-Medium", size: 5))
                            .foregroundColor(Color("Primary"))
                        
                        // "06.00 pm" SHOULD BE CHANGABLE
                        Text(EM.formattedTime(date: events[0].startDate))
                            .font(Font.custom("Fredoka-Medium", size: 20))
                            .foregroundColor(Color("Primary"))
                        Spacer()
                    }
                    
                    //Content should be changeable
                    VStack(alignment: .leading, spacing: 4){
                        Text(events[0].notes!)
                            .font(Font.custom("Fredoka-Regular", size: 17))
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("INVITEES STATUS")
                            .font(Font.custom("Fredoka-Medium", size: 11))
                            .foregroundColor(.gray)
                        
                        //Member List
                        Button {
                            // SHOULD NAVIGATE TO MEMBER DETAILS
                        } label: {
                            HStack {
                                ForEach (0 ..< HpVM.calendars[HpVM.currentCalendar].calendarMembers.count) { users in
                                    if (users < 4) {
                                        Image(systemName: "person.crop.circle.badge.fill")
                                            .font(Font.custom("Fredoka-Medium", size: 20))
                                            .foregroundColor(.green)
                                    }
                                }
                            }
                            
                            if (HpVM.calendars[HpVM.currentCalendar].calendarMembers.count > 4) {
                                Text("+\(HpVM.calendars[HpVM.currentCalendar].calendarMembers.count-4)")
                                    .font(Font.custom("Fredoka-Medium", size: 12))
                                    .foregroundColor(.green)
                            }
                        }
                        
                        
                    }
                    
                    HStack(alignment: .center) {
                        Button {
                            //code here
                        } label: {
                            Text("Decline")
                                .frame(minWidth: 128)
                        }
                        .buttonStyle(BorderButton())
                        Spacer()
                        Button {
                            //code here
                        } label: {
                            Text("Accept")
                                .frame(minWidth: 128)
                        }
                        .buttonStyle(FillButton())
                    }
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
            } else{
                // if there's no event
                VStack(alignment: .leading, spacing: 14){
                    HStack(){
                        Spacer()
                        Image("calendar")
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("You don't have any proposed event yet")
                            .font(Font.custom("Fredoka-Medium", size: 19))
                            .foregroundColor(Color("Primary"))
                        Text("Propose a new event for your family?")
                            .font(Font.custom("Fredoka-Regular", size: 16))
                            .foregroundColor(.gray)
                    }
                    
                    HStack(alignment: .center) {
                        NavigationLink{
                            Proposenewpage(selectedCalendar: self.$selectedCalendar)
                        } label: {
                            Text("Propose a new event")
                                .frame(minWidth: 300)
                        }
                        .buttonStyle(FillButton())
                    }
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
            }
            
        }
        .onAppear {
            EM.requestAccess { granted in
                if granted {
                    fetchEvents(from: self.selectedCalendar!)
                }
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .EKEventStoreChanged)) { _ in
            fetchEvents(from: self.selectedCalendar!)
        }
    }
 
    func fetchEvents(from calendar: EKCalendar) {
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)!
        events = EM.getSpecificCalendarEvents(from: calendar)
        events = events.sorted { (event1, event2) -> Bool in
            return event1.startDate.compare(event2.startDate) == .orderedAscending
        }
    }
    
}
