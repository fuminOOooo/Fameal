//
//  JoinInfoModal.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 04/05/23.
//

import SwiftUI

struct AcceptModal: View {
    @Binding var isPresented: Bool
    
//    func close(){
//        withAnimation(.spring()){
//            
//        }
//    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack{
                ZStack{
                    Image(systemName: "checkmark.seal.fill")
                        .font(Font.custom("Fredoka-Medium", size: 20))
                        .foregroundColor(Color(uiColor: .systemGreen))
                }
                Text("You've successfully joined the event!")
                    .font(Font.custom("Fredoka-Regular", size: 16))
                    .foregroundColor(Color("PB-800"))
            }
            
            Text("Hey there! Don't forget to attend the event you've accepted.")
                .font(Font.custom("Fredoka-Medium", size: 20))
                .foregroundColor(Color("PB-800"))
            
//            Text("If you've already been invited, just check your email inbox for the invite!")
                .font(Font.custom("Fredoka-Regular", size: 16))
                .foregroundColor(Color("PB-800"))
            
            Button {
                self.isPresented = false
            } label: {
                Text("Okay")
                    .frame(maxWidth: .infinity)
            }.buttonStyle(BorderButton())
                .padding(.top)
            
        }
        .padding(.init(top: 24, leading: 20, bottom: 24, trailing: 20))
        .frame(maxWidth: 347)
        .background(Color.white)
        .cornerRadius(10)
//        .shadow(radius: 10)
        .opacity(isPresented ? 1 : 0)
        .scaleEffect(isPresented ? 1 : 0)
        .animation(.spring(response: 0.4, dampingFraction: 0.8))
        .transition(.move(edge: .bottom))
    }
    
}
