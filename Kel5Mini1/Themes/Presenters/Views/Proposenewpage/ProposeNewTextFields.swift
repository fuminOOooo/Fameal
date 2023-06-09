//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 28/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct ProposeNewTextFields: View {
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    @State private var selectedDate = Date()
    @Binding var eventName: String
    @Binding var eventDesc: String
    
    var body: some View {
        VStack (spacing: 4) {
            
                VStack {
                        // Component 4
                        TextField(text: $eventName, prompt: Text("Add event name")) {
                        }
                        .bold()
                        .padding()
                        
                        Divider()
                        
                        // Component 5
                        TextField(text: $eventDesc, prompt: Text("Add description")) {
                        }
                        .padding()
                        
                        Spacer()
                        
                    }
                .cornerRadius(10)
                
            }
    }
}
