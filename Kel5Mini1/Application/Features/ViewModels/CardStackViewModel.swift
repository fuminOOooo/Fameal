//
//  CardStack View Model.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 04/05/23.
//

import Foundation
import Combine

class CardStackViewModel : ObservableObject {
    
    @Published var cards: [OneCard] = [
        OneCard(title: "Bokap sehat?"),
        OneCard(title: "Card 2"),
        OneCard(title: "Card 3"),
        OneCard(title: "Card 4"),
        OneCard(title: "Card 5")
    ]
    @Published var unmovedCards : Int = 5
}
