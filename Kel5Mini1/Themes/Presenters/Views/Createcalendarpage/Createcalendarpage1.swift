//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct Createcalendarpage1: View {
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    var CcVM : CreatecalendarViewModel
    
    var body: some View {
        VStack (spacing: 4) {
        
            
            // Component 1
            HStack {
                Text("Create your calendar")
                    .font(Font.custom("Fredoka-SemiBold", size: 26))
                    .foregroundColor(Color("PB-800"))
                
                Spacer()
            }
            
            // Component 2
            HStack {
                Text("Start organizing your family meal time easily!")
                    .font(Font.custom("Fredoka", size: 22))
                    .foregroundColor(Color("PB-800"))
            }
            
            
            
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
