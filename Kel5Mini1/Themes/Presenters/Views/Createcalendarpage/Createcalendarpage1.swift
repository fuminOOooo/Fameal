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
    
    var body: some View {
        VStack (spacing: 4) {
        
            
            // Component 1
            HStack {
                Text("Create your calendar")
                    .font(Font.custom("Fredoka-Regular", size: 18))
                    .foregroundColor(.gray)
                
                Spacer()
            }
            
            // Component 2
            HStack {
                Text("Start organizing your family meal time easily!")
                    .font(Font.custom("Fredoka-Medium", size: 26))
                    .foregroundColor(Color("PB-800"))
                Spacer()
            }
            
            
            
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
