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
    
    @State var temporarySelectedTime = Date()
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    @ObservedObject var PnVM : ProposenewViewModel
    
    var body: some View {
        VStack () {
            
            HStack() {
                
                Image(systemName: "clock")
                    .bold()
                Text("Start time")
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                DatePicker("", selection: $temporarySelectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                
            }
            
            HStack {
                
                Button {
                    
                } label: {
                    Text("Propose Event")
                        .foregroundColor(.white)
                        .background(Color("Secondary"))
                        .bold()
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(FillButton())
                .padding(.top)
                
            }
            
        }
        .padding()
    }
}
