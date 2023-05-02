//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 21/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct HomePageHeader: View {
    
    @ObservedObject var HpVM : HomepageViewModel
    
    @State var calendarSelection: Bool = false
    
    var body: some View {
        VStack (spacing: 4) {
            
            // Component 1
            HStack {
                
                // Calendar Name
                Button {
                    
                    calendarSelection.toggle()
                    
                } label: {
                    
                    
                    /// INI KALENDER YANG LAGI DI SELECT BUAT HOMEPAGE KESELURUHAN
                    Text("    ")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                    
                    Image(systemName: "chevron.down")
                        .font(Font.custom("Fredoka-Medium", size: 16))
                        .foregroundColor(Color("PB-800"))
                    
                }
                .sheet(isPresented: $calendarSelection, content: {
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            
                            Text("Families")
                                .font(Font.custom("Fredoka-Medium", size: 20))
                                .foregroundColor(Color("PB-800"))
                            
                            Spacer()
                            
                        }
                        .padding()
                        
                        ScrollView {
                            
                            
                            /// INI HARUSNYA ADA FOR EACH BUAT SETIAP KALENDER
                            ForEach(  ) { i in
                                Button  {
                                    
                                    HpVM.currentCalendar = i
                                    calendarSelection.toggle()
                                    
                                } label: {
                                    HStack {
                                        
                                        VStack {
                                            
                                            HStack {
                                                
                                                /// INI HARUSNYA ADA JUDUL DARI KALENDER
                                                Text (     )
                                                    .font(Font.custom("Fredoka-Medium", size: 20))
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                Text("\(HpVM.calendars[i].calendarMembers.count) Member(s)")
                                                    .font(Font.custom("Fredoka-Light", size: 16))
                                                Spacer()
                                            }
                                            
                                        }
                                        .padding(.leading)
                                        
                                        if (HpVM.currentCalendar == i) {
                                            VStack {
                                                Image(systemName: "checkmark")
                                                    .bold()
                                                    .padding(.trailing)
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: 340, minHeight: 80)
                                .background(HpVM.currentCalendar == i ? Color("PB-50") : Color(.white))
                                .cornerRadius(8)
                                .foregroundColor(Color("PB-800"))
                                .padding(.leading)
                                .padding(.trailing)
                                
                                if (HpVM.calendars.count != 1 && i < HpVM.calendars.count-1) {
                                    Divider()
                                        .frame(maxWidth: 340)
                                }
                                
                            }
                            
                        }
                        
                        Button {
                            
                        } label: {
                            Text("+ Add another family calendar")
                                .font(Font.custom("Fredoka-Regular", size: 16))
                                .foregroundColor(Color("Secondary"))
                        }
                        
                        
                        
                    }
                    .presentationDetents([.medium])
                    
                })
                
                Spacer()
                
                //Add Calendar Button
                NavigationLink {
                    Proposenewpage(PnVM: PnVM)
                } label: {
                    Image(systemName: "plus")
                        .font(Font.custom("Fredoka-Semibold", size: 24))
                        .foregroundColor(Color("PB-800"))
                        .bold()
                }
                
            }
            
            
            //Component 2
            HStack {
                
                Button {
                    
                    // SHOULD NAVIGATE TO MEMBER DETAILS
                    
                    
                } label: {
                    HStack (spacing: -2) {
                        
                        /// INI HARUSNYA JUMLAH DARI SEMUA MEMBER YANG JOIN CALENDAR
                        ForEach (0 ..<     ) { users in
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                            
                        }
                    }
                    
                    /// INI HARUSNYA JUMLAH DARI SEMUA MEMBER YANG JOIN CALENDAR
                    if (       > 3) {
                        
                        /// INI HARUSNYA JUMLAH DARI SEMUA MEMBER YANG JOIN CALENDAR
                        Text("\(           -3)+")
                            .font(Font.custom("Fredoka", size: 14))
                            .foregroundColor(Color("PB-800"))
                    }
                }
                
                Spacer()
                
            }
            
        }
    }
}
