//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import SwiftUI
import CoreData

struct Proposenewpage: View {
    
    var PnVM: ProposenewViewModel
    
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var eventName : String = ""
    @State private var eventDesc : String = ""
    @ObservedObject var calendarManager = CalendarManager()
    
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body:some View {
        
            VStack {
                
                ProposeNewEventBackButton()
                
                ProposeNewEventDatePicker(PnVM: PnVM, selectedDate : $selectedDate)
                
                ProposeNewStartTime(selectedTime: $selectedTime)
               
                ProposeNewTextFields(PnVM: PnVM, tempEventName: $eventName, tempDescription: $eventDesc)
                
                ProposeNewProposalButton(calendarManager : calendarManager, selectedDate : selectedDate, selectedTime: selectedTime, eventName: eventName, eventDesc: eventDesc)
                
                Spacer()
                
            }
            .navigationTitle("Propose New Event")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            .navigationBarBackButtonHidden(true)
    }

    
}
