//
//  CardStack Model.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 04/05/23.
//

import Foundation

class OneCard: Identifiable {
    
    let id = UUID()
    let title: String
    var moved: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
}
