//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import SwiftUI
import EventKit

struct Proposenewpage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var eventManager = EventManager()
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var eventName: String = ""
    @State private var eventDesc: String = ""
    @Binding var selectedCalendar: EKCalendar?
    
    var body:some View {
        
        VStack {
            
            ProposeNewEventBackButton()
            
            ScrollView {
                
                ProposeNewEventDatePicker(selectedDate : $selectedDate)
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                ProposeNewStartTime(selectedTime:$selectedTime)
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                ProposeNewTextFields(eventName:$eventName, eventDesc: $eventDesc)
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                ProposeNewProposalButton(selectedDate: selectedDate, selectedTime: selectedTime,eventName: eventName, eventDesc: eventDesc, selectedCalendar: self.$selectedCalendar)
                
            }
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Propose New Event")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear{
            eventManager.getSpecificCalendarEvents(from: selectedCalendar!)
        }
    } 
}
