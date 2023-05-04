//
//  ContentView.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import SwiftUI

struct GameRulesWholeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var CSVM = CardStackViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Game Rules")
            
            Spacer()
            
            NavigationLink {
                CardStackView()
            } label: {
                Text("Start Prompt")
                    .padding()
                    .frame(width: 300)
                    .font(Font.custom("Fredoka-Medium", size: 16))
                    .background(Color(.orange))
            }
            .buttonStyle(FillButton())
            
            Spacer()

        }
        .navigationBarBackButtonHidden(true)
        .padding()
        
    }
}
