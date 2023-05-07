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
                
                ProposeNewStartTime(selectedTime:$selectedTime)
                
                ProposeNewTextFields(eventName:$eventName, eventDesc: $eventDesc)
                
                ProposeNewProposalButton(selectedDate: selectedDate, selectedTime: selectedTime,eventName: eventName, eventDesc: eventDesc, selectedCalendar: self.$selectedCalendar)
            }
            
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Propose New Event")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .onDisappear{
            eventManager.getSpecificCalendarEvents(from: selectedCalendar!)
        }
    } 
}
