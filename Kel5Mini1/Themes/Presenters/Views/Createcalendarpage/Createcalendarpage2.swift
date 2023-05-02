//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 30/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct Createcalendarpage2: View {
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    @State var tempCalendarName: String = ""
    
    var CcVM : CreatecalendarViewModel
    
    var body: some View {
        VStack () {
        
            // Component 3
            HStack {
                TextField(text: $tempCalendarName, prompt: Text("Add calendar name")) {
                        
                }
                .font(Font.custom("Fredoka-Medium", size: 16))
                .foregroundColor(Color("PB-800"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .padding(.leading)
            .padding(.trailing)
            
            // Component 4
            HStack {
                Button {
                    
                } label: {
                    if (tempCalendarName == "") {
                        Text("Create Calendar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("SO-100"))
                            .cornerRadius(6)
                            .font(Font.custom("Fredoka-Medium", size: 16))
                    } else {
                        Text("Create Calendar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("Secondary"))
                            .cornerRadius(6)
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .frame(maxWidth: .infinity)
                    }
                }
                .disabled(tempCalendarName == "")
                .padding(.leading)
                .padding(.trailing)
            }
            
        }
    }
}




