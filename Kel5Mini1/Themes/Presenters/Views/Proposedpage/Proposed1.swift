//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct Proposed1: View {
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack (spacing: 4) {
            
        // Component 1
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom("Fredoka-Bold", size: 14))
                            .foregroundColor(Color("PB-800"))
                            .padding(.leading)
                    }
                
            }
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
