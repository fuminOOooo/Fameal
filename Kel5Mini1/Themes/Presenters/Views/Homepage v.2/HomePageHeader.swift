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
    
    @ObservedObject var PnVM = ProposenewViewModel()
    @ObservedObject var HpVM = HomepageViewModel()
    @ObservedObject var CcVM = calendarViewModel()
    @State var calendarName: String = ""
    @Binding var selectedCalendarIndex: Int
    @State var calendarSelection: Bool = false
    @State private var isCreatingCalendar: Bool = false
    
    var body: some View {
        VStack (spacing: 4) {
            
            // Component 1
            HStack {
                
                // Calendar Name
                Button {
                    calendarSelection.toggle()
                } label: {
                    Text(CcVM.getUserCalendars()[selectedCalendarIndex].title.dropFirst(8))
                        .font(Font.custom("Fredoka-Semibold", size: 26))
                        .foregroundColor(Color("PB-800"))
                    
                    Image(systemName: "chevron.down")
                        .font(Font.custom("Fredoka-Bold", size: 16))
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
                            
                            ForEach(0..<CcVM.getUserCalendars().count) { i in
                                Button  {                                    selectedCalendarIndex = i
                                    calendarSelection.toggle()
                                } label: {
                                    HStack {
                                        VStack {
                                            HStack {
                                                Text (CcVM.getUserCalendars()[i].title.dropFirst(8))
                                                    .font(Font.custom("Fredoka-Medium", size: 20))
                                                Spacer()
                                            }
                                            
                                            HStack {
                                                //fill with calendar member count .font(Font.custom("Fredoka-Light", size: 16))
                                                Spacer()
                                            }
                                            
                                        }
                                        .padding(.leading)
                                        
                                        if (selectedCalendarIndex == i) {
                                            VStack {
                                                Image(systemName: "checkmark")
                                                    .bold()
                                                    .padding(.trailing)
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: 340, minHeight: 80)
                                .background(selectedCalendarIndex == i ? Color("PB-50") : Color(.white))
                                .cornerRadius(8)
                                .foregroundColor(Color("PB-800"))
                                .padding(.leading)
                                .padding(.trailing)
                                
                                
                                
                                if (CcVM.getUserCalendars().count != 1 && i < CcVM.getUserCalendars().count-1) {
                                    Divider()
                                        .frame(maxWidth: 340)
                                }
                                
                            }
                            
                        }
                        Button {
                            self.isCreatingCalendar.toggle()
                        } label: {
                            Text("+ Add another family calendar")
                                .font(Font.custom("Fredoka-Regular", size: 16))
                                .foregroundColor(Color("Secondary"))
                        }.sheet(isPresented: self.$isCreatingCalendar) {
                            Createcalendarpage(isCreatingCalendar: self.$isCreatingCalendar, calendarSelection: self.$calendarSelection, selectedCalendarIndex: self.$selectedCalendarIndex)
                        }
                    }
                    .presentationDetents([.medium])
                    .padding(.bottom)
                })
                
                Spacer()
                
                //Add Event Button
                NavigationLink {
                    Proposenewpage(PnVM: PnVM)
                } label: {
                    Image(systemName: "plus")
                        .font(Font.custom("Fredoka-Bold", size: 24))
                        .foregroundColor(Color("PB-800"))
                        .bold()
                }
                
            }
            
            
            //Component 2
            HStack {
                Button {
                    // SHOULD NAVIGATE TO MEMBER DETAILS
                } label: {
                    HStack (spacing: -4) {
                        
                        // "temporaryUsers" SHOULD BE CHANGABLE
                        ForEach (0 ..< HpVM.calendars[HpVM.currentCalendar].calendarMembers.count) { users in
                            if (users < 3) {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    
                    // "temporaryUsers" SHOULD BE CHANGABLE
                    if (HpVM.calendars[HpVM.currentCalendar].calendarMembers.count > 3) {
                        Text("\(HpVM.calendars[HpVM.currentCalendar].calendarMembers.count-3)+")
                            .font(Font.custom("Fredoka", size: 14))
                            .foregroundColor(Color("PB-800"))
                    }
                }
                
                Spacer()
                
            }
        }
    }
}
