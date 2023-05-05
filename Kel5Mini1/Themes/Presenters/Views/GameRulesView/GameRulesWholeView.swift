//
//  ContentView.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import SwiftUI

struct GameRulesWholeView: View {
    
    @ObservedObject var CSVM = CardStackViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text ("How to play topics prompt")
                .foregroundColor(Color("PB-800"))
                .font(Font.custom("Fredoka-Semibold", size: 26))
            
            
            
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
