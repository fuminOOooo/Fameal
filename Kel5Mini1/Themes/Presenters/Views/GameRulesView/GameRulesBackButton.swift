//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 25/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct GameRulesBackButton: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack (spacing: 4) {
            
        // Back Button
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(Font.custom("Fredoka-Bold", size: 14))
                            .foregroundColor(Color.black)
                            .padding(.leading)
                    }
                
            }
        }
        .padding(.leading)
        .padding(.trailing)
        
    }
}
