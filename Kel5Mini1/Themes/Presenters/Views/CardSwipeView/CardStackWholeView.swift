//
//  CardStack View.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import Foundation
import SwiftUI

struct CardStackWholeView: View {

    @State var swiped: Bool = false
    @State var index: Int = 0
    @ObservedObject var CSVM = CardStackViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                Text("\(CSVM.unmovedCards) cards left")
                    .font(.subheadline)
                
                // All Stack of Cards
                ZStack {
                    
                    ForEach(CSVM.cards) { card in
                        Cards(card: card, index: index, totalCards: CSVM.cards.count, CSVM: CSVM)
                    }
                    
                }
                .padding()
                
                // Text Under Cards
                VStack {
                    Text("SWIPE TO CHANGE THE TOPIC")
                        .font(.subheadline)
                    Text("TAP TO TAKE A CARD BACK TO THE DECK")
                        .font(.subheadline)
                }
                
                
                Spacer()
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}
