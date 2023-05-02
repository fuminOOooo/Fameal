//
//  Homepage2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 22/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct HomePageProposedEvent: View {
    
    @ObservedObject var HpVM : HomepageViewModel
    
    var body: some View {
        
        VStack {
            
            // Component 5
            HStack {
                
                Text ("Proposed Event")
                    .font(Font.custom("Fredoka-Medium", size: 20))
                    .foregroundColor(Color("PB-800"))
                
                Spacer()
                
                // SHOULD NAVIGATE TO PROPOSED EVENTS LIST
                
                NavigationLink {
                    Proposed()
                } label: {
                    Text ("See all")
                        .font(Font.custom("Fredoka", size: 16))
                        .foregroundColor(Color("Secondary"))
                }
                
                
            }
            
            // Component 6
            HStack {
                
                VStack {
                    
                    // Component 6.1, 6.2 & 6.3
                    
                    VStack (spacing: 14) {
                        
                        // Component 6.1
                        HStack {
                            
                            HStack {
                                
                                // "Elvis" SHOULD BE CHANGABLE
                                Text("Elvis has invited you to join...")
                                    .font(Font.custom("Fredoka", size: 12))
                                    .foregroundColor(Color("PB-800"))
                            }
                            Spacer()
                        }
                        
                        // Component 6.2 & 6.3
                        HStack {
                            
                            // Component 6.2
                            HStack {
                                
                                // "Monday, 17 Apr" SHOULD BE CHANGABLE
                                Text("Monday, 17 Apr")
                                    .font(Font.custom("Fredoka-Medium", size: 16))
                                    .foregroundColor(Color("Primary"))
                                
                            }
                            
                            Image(systemName: "circle.fill")
                                .font(Font.custom("Fredoka-Medium", size: 3))
                                .foregroundColor(Color("Primary"))
                            
                            // Component 6.3
                            HStack {
                                
                                // "09.00 pm" SHOULD BE CHANGABLE
                                Text("09.00 pm")
                                    .font(Font.custom("Fredoka-Medium", size: 16))
                                    .foregroundColor(Color("Primary"))
                                
                                Spacer()
                                
                            }
                        }
                        
                    }
                    
                    // Component 6.4
                    HStack {
                        
                        // Text SHOULD BE CHANGABLE
                        Text("I got a new resto recommendation, let’s eat there!")
                            .font(Font.custom("Fredoka-Light", size: 16))
                            .foregroundColor(Color("PB-800"))
                        
                        Spacer()
                        
                    }
                    .padding(.init(top: 0.5, leading: 0, bottom: 0, trailing: 0))
                    
                    // Component 6.5
                    HStack {
                        Text("INVITEES STATUS")
                            .font(Font.custom("Fredoka-Medium", size: 12))
                            .foregroundColor(Color("PB-800"))
                        Spacer()
                    }
                    .padding(.top)
                    
                    // Component 6.6
                    HStack {
                        Button {
                            
                            // SHOULD NAVIGATE TO MEMBER DETAILS
                            
                            
                        } label: {
                            HStack {
                                
                                ForEach (0 ..< HpVM.calendars[HpVM.currentCalendar].calendarMembers.count) { users in
                                    if (users < 3) {
                                        Image(systemName: "person.crop.circle.badge.clock.fill")
                                            .font(Font.custom("Fredoka-Medium", size: 20))
                                            .foregroundColor(Color("PB-300"))
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            // "temporaryUsers" SHOULD BE CHANGABLE
                            if (HpVM.calendars[HpVM.currentCalendar].calendarMembers.count > 3) {
                                Text("+\(HpVM.calendars[HpVM.currentCalendar].calendarMembers.count-3)")
                                    .font(Font.custom("Fredoka-Medium", size: 12))
                                    .foregroundColor(Color("PB-300"))
                            }
                        }
                        Spacer()
                    }
                    .padding(.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                    
                    // Component 6.7
                    HStack (spacing: 14){
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Text("Decline")
                        }.buttonStyle(BorderButton())
  
                        Button {
                            
                        } label: {
                            Text("Accept")
                        }.buttonStyle(FillButton())
                    }
                }
                .padding()
                .frame(height: 260)
                
            }
            .background(.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 2)
        }
        .padding(.top)
    }
}
