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
                if (eventName.isEmpty || eventDesc.isEmpty) {
                    Text("Propose New Event")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color("SO-100"))
                        .cornerRadius(6)
                        .font(Font.custom("Fredoka-Medium", size: 16))
                } else {
                    Text("Propose New Event")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 44)
                        .background(Color("Secondary"))
                        .cornerRadius(6)
                        .font(Font.custom("Fredoka-Medium", size: 16))
                        .frame(maxWidth: .infinity)
                }
            }
            .disabled(eventName.isEmpty || eventDesc.isEmpty)
        }
        .padding()
    }
}
