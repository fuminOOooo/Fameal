//
//  ContentView.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import SwiftUI

struct GameRulesView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                GameRulesBackButton()
                
                GameRulesWholeView()
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        GameRulesView()
    }
}
