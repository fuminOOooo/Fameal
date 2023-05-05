//
//  ContentView.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import SwiftUI

struct GameRulesWholeView: View {
    
    let promptTexts : [String] = [
        "Swipe the top card to get a new topic 🤔",
        "Let each of your family member try to answer the prompt 🤩",
        "Have fun! Let things flow towards a stronger relationship 🥰"
    ]
    
    @ObservedObject var CSVM = CardStackViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text ("How to play topics prompt")
                .foregroundColor(Color("PB-800"))
                .font(Font.custom("Fredoka-Semibold", size: 26))
            
            Spacer()
            
            VStack {
                
                ForEach (0..<promptTexts.count) { i in
                    
                    HStack (spacing: 10) {
                        
                        Spacer()
                        
                        VStack {
                            if (i == 0) {
                                Image("Prompt\(i+1)")
                                    .resizable()
                                    .frame(width: 100, height: 150)
                            } else if (i == 1) {
                                Image("Prompt\(i+1)")
                                    .resizable()
                                    .frame(width: 100, height: 80)
                            } else if (i == 2) {
                                Image("Prompt\(i+1)")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                        }
                        
                        VStack {
                            
                            HStack {
                                
                                ZStack {
                                    
                                    Image(systemName: "circle.fill")
                                        .resizable()
                                        .foregroundColor(Color("Secondary"))
                                        .frame(width: 25, height: 25)
                                    
                                    Text("\(i+1)")
                                        .foregroundColor(.white)
                                    
                                }
                                
                                Spacer()
                            }
                            
                            
                            Text(promptTexts[i])
                                .foregroundColor(Color("PB-800"))
                                .font(Font.custom("Fredoka", size: 17))
                            
                            
                        }
                        .padding(.leading)
                        .frame(width: 200,height: 120)
                        
                        Spacer()
                        
                    }
                    
                }
                
                
            }
            
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
