//
//  Card Shape.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 03/05/23.
//

import Foundation
import SwiftUI

struct Cards: View {
    
    let card: OneCard
    let index: Int
    let totalCards: Int
    @State private var offset = CGSize.zero
    @State public var isResetting = false
    var CSVM : CardStackViewModel
    
    
    var rotationAngle: Double {
        let cardOffset = Double(index - totalCards / 2)
        return Double(offset.width / 10) + cardOffset
    }
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                Image("CardGradient")
                
                Image("cardImage")
                    .padding(.init(top: -190, leading: 130, bottom: 0, trailing: 0))
                
                HStack {
                    VStack {
                        Spacer()
                        Text(card.title)
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Semibold", size: 26))
                        HStack {
                            Text("BY FAMEAL")
                                .foregroundColor(.white)
                                .font(Font.custom("Fredoka-Medium", size: 12))
                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top)
                        
                    }
                    .frame(height: 280)
                    Spacer()
                }
                .frame(width: 245)
                
            }
            
        }
        .shadow(radius: 5)
        .padding()
        .cornerRadius(10)
        .offset(offset)
        .rotationEffect(.degrees(rotationAngle))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    card.moved = true
                    print(card.moved)
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    withAnimation {
                        if abs(offset.width) > abs(offset.height) {
                            offset = CGSize(width: offset.width > 0 ? 500 : -500, height: 0)
                        } else {
                            offset = CGSize(width: 0, height: 500)
                        }
                    }
                }
        )
        .animation(.spring())
        .disabled(isResetting)
        .opacity(isResetting ? 0.5 : 1)
        .onTapGesture {
            card.moved = false
            print(card.moved)
            isResetting = true
            withAnimation(.spring()) {
                offset = .zero
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isResetting = false
            }
        }
        
    }
}
