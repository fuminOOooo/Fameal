//
//  Upcoming2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct Upcoming2: View {
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    var body: some View {
        ScrollView (.vertical){
            VStack(spacing: 24){
                ForEach (0..<temporaryUsers.count) { temporaryUser in
                    VStack(alignment: .leading, spacing: 14){
                        HStack{
                            // "Monday, 17 Apr" SHOULD BE CHANGABLE
                            Text("Monday, 17 Apr")
                                .font(Font.custom("Fredoka-Medium", size: 20))
                                .foregroundColor(Color("Primary"))
                            
                            Image(systemName: "circle.fill")
                                .font(Font.custom("Fredoka-Medium", size: 5))
                                .foregroundColor(Color("Primary"))
                            
                            // "06.00 pm" SHOULD BE CHANGABLE
                            Text("06.00 pm")
                                .font(Font.custom("Fredoka-Medium", size: 20))
                                .foregroundColor(Color("Primary"))
                            Spacer()
                        }
                        
                        //Content should be changeable
                        VStack(alignment: .leading, spacing: 4){
                            Text("It's Mealtime!")
                                .font(Font.custom("Fredoka-Medium", size: 17))
                                .foregroundColor(Color("Grey"))
                            
                            Text("This iftar, Dary will pay for everything!")
                                .font(Font.custom("Fredoka-Regular", size: 17))
                                .foregroundColor(.gray)
                        }
                        
                        
                        HStack(alignment: .center) {
                            NavigationLink {
                                //code here
                                GameRulesView()
                            } label: {
                                Text("Find Topic 🤩")
                                    .frame(minWidth: 300)
                            }.buttonStyle(FillButton())
                        }
                        
                    }
                    .padding()
                    .background(Color("PB-50"))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}
