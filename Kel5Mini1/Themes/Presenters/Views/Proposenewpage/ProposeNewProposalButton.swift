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
    
    @EnvironmentObject var calendarManager: CalendarManager
    @Environment(\.dismiss) private var dismiss
    
    var selectedDate: Date
    var selectedTime: Date
    var eventName: String
    var eventDesc: String
    
    var body: some View {
        VStack () {

            HStack {
                
                
                Button (action: {
                    
//                    if(selectedDate != Date || selectedTime || eventName == nil || eventDesc == nil ){
                        
//                    }else {
                        
                        calendarManager.addEvent(startDate: selectedDate, startTime: selectedTime, title: eventName, notes: eventDesc)
                        
                        dismiss()
//                    }
                    
                    
                }, label: {
                    Text("Propose Event test")
                        .foregroundColor(.white)
                        .background(Color("Secondary"))
                        .bold()
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(FillButton())
                .padding(.top)
                
            }
            
        }
        .padding()
    }
}
