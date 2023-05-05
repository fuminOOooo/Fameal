//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 02/05/23.
//

import Foundation
import SwiftUI
import CoreData

struct ProposeNewProposalButton: View {
    
    var calendarManager: CalendarManager
    @Environment(\.dismiss) private var dismiss
    
    @State var temporarySelectedTime = Date()
    var selectedDate: Date
    var selectedTime: Date
    var eventName: String
    var eventDesc: String
    
    var body: some View {
        VStack(alignment: .center) {
            Button {
                calendarManager.addEvent(startDate: selectedDate, startTime: selectedTime, title: eventName, notes: eventDesc)
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
