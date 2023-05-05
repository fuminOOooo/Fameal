//
//  CardStack View.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import Foundation
import SwiftUI

struct CardStackView: View {

    @State var swiped: Bool = false
    @State var index: Int = 0
    
    
    var body: some View {
        
        VStack {
            
            CardStackWholeView()
            
        }.navigationBarBackButtonHidden(true)
        
    }
        
}
