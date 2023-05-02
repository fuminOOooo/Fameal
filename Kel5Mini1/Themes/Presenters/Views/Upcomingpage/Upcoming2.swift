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
            ForEach (0..<temporaryUsers.count) { temporaryUser in
                HStack {
                    
                    VStack {
                        
                        // Component 4.1
                        HStack {
                            
                            HStack {
                                
                                // "Monday, 17 Apr" SHOULD BE CHANGABLE
                                Text("Monday, 17 Apr")
                                    .font(Font.custom("Fredoka-Medium", size: 24))
                                    .foregroundColor(Color("Primary"))
                                
                                Image(systemName: "circle.fill")
                                    .font(Font.custom("Fredoka-Medium", size: 3))
                                    .foregroundColor(Color("Primary"))
                                
                                // "06.00 pm" SHOULD BE CHANGABLE
                                Text("06.00 pm")
                                    .font(Font.custom("Fredoka-Medium", size: 24))
                                    .foregroundColor(Color("Primary"))
                            }
                            Spacer()
                        }
                        
                        // Component 4.2
                        HStack {
                            
                            Text("It's Mealtime!")
                                .font(Font.custom("Fredoka-Regular", size: 18))
                                .foregroundColor(Color("PB-800"))
                            
                            Spacer()
                            
                        }
                        .padding(.top)
                        
                        
                        // Component 4.3
                        HStack {
                            // Text SHOULD BE CHANGABLE
                            Text("This iftar, Hannah will pay for everything!")
                                .font(Font.custom("Fredoka-Light", size: 14))
                                .foregroundColor(Color("PB-800"))
                            Spacer()
                            
                        }
                        
                        HStack {
                            HStack (spacing: -2) {
                                
                                // "temporaryUsers" SHOULD BE CHANGABLE
                                ForEach (0 ..< temporaryUsers.count) { users in
                                    if (users < 3) {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.white)
                                            .shadow(radius: 3)
                                    }
                                }
                            }
                            
                            // "temporaryUsers" SHOULD BE CHANGABLE
                            if (temporaryUsers.count > 3) {
                                Text("\(temporaryUsers.count-3)+")
                                    .font(Font.custom("Fredoka", size: 14))
                                    .foregroundColor(Color("PB-800"))
                            }
                            
                            Spacer()
                        }
                        
                        // Component 4.4
                        HStack {
                            
                            Button {
                                
                            } label: {
                                Text("Need an interesting topic to discuss? Click Me! 🥳")
                                    .font(Font.custom("Fredoka-Medium", size: 12))
                                    .foregroundColor(.white)
                            }
                            
                            
                        }
                        .padding()
                        .frame(width: 320, height: 44)
                        .background(Color("Secondary"))
                        .cornerRadius(6)
                        
                    }
                    .padding()
                    .frame(height: 220)
                }
                .background(Color("PB-50"))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
                .padding(.bottom)
            }
            .padding()
        }
    }
}
