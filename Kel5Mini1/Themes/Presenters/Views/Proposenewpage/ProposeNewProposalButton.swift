//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 02/05/23.
//

import Foundation
import SwiftUI
import EventKit

struct ProposeNewProposalButton: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var eventManager = EventManager()
    var selectedDate: Date
    var selectedTime: Date
    var eventName: String
    var eventDesc: String
    @Binding var selectedCalendar: EKCalendar?
    
    var body: some View {
        VStack(alignment: .center) {
            Button {
//                print(selectedCalendar)
                eventManager.addEvent(to: self.selectedCalendar ?? selectedCalendar!, startDate: selectedDate, startTime: selectedTime, title: eventName, description: eventDesc)
                dismiss()
            } label: {
                Text("Propose Event")
                    .frame(minWidth: 317)
            }
            .buttonStyle(FillButton())
        }
        .padding()
    }
}
