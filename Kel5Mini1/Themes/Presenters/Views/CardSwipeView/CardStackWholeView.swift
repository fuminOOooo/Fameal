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
        VStack {
            Spacer()
            
            // Text Under Cards
            VStack {
                Text("SWIPE TO CHANGE THE TOPIC")
                    .foregroundColor(Color("Gray3"))
                    .font(Font.custom("Fredoka-Medium", size: 16))
                Text("TAP TO TAKE A CARD BACK TO THE DECK")
                    .foregroundColor(Color("Gray3"))
                    .font(Font.custom("Fredoka-Medium", size: 16))
            }
            .padding(.bottom, 60)
            
            // All Stack of Cards
            ZStack {
                
                Text("OUT OF TOPICS!")
                    .foregroundColor(Color("Gray3"))
                    .font(Font.custom("Fredoka-Medium", size: 16))
                
                ForEach (0..<CSVM.cards.count) { index in
                    Cards(card: CSVM.cards[index], index: index, totalCards: CSVM.cards.count, CSVM: CSVM)
                }
                
            }
            .padding()
            
            Spacer()
        }
    }
}
