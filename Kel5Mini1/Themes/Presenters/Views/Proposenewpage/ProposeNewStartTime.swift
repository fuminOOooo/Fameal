//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 28/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct ProposeNewStartTime: View {
    
    @Binding var selectedTime: Date
    
    var body: some View {
        VStack () {
            
            HStack() {
                
                Image(systemName: "clock")
                    .foregroundColor(Color("PB-800"))
                    .bold()
                Text("START")
                    .font(Font.custom("Fredoka-Regular", size: 17))
                    .foregroundColor(Color("PB-800"))
                
                Spacer()
                
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                
            }
        }
        .padding(.init(top: 0, leading: 6, bottom: 0, trailing: 6))
    }
}
