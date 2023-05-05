//
//  Upcoming2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import Foundation
import SwiftUI
import CoreData
import EventKit

struct Proposed2: View {
    
    @EnvironmentObject var calendarManager : CalendarManager
    @Binding var events: [EKEvent]
    
    @StateObject var HpVM = HomepageViewModel()
    
    var body: some View {
        ScrollView (.vertical){
            VStack(spacing: 2){
                //harusnya fetch event in the specific calendar choosen
//                ForEach (0..<HpVM.calendars.count) { calendars in
                    ForEach(events, id:\.self) { event in
                        VStack(alignment: .leading, spacing: 14){
                            VStack(alignment: .leading, spacing: 14){
                                HStack(){
                                    //Content should be changeable
                                    Text("Elvis has invited you to join...")// ini tu "has invited you to join" nya default, Elvis nya kan yang ganti2
                                        .font(Font.custom("Fredoka-Regular", size: 14))
                                        .foregroundColor(Color("PB-900"))
                                }
                                
                                HStack{
                                    // "Monday, 17 Apr" SHOULD BE CHANGABLE
                                    Text("\(calendarManager.formattedDate(date: event.startDate))")
                                        .font(Font.custom("Fredoka-Medium", size: 20))
                                        .foregroundColor(Color("Primary"))
                                    
                                    Image(systemName: "circle.fill")
                                        .font(Font.custom("Fredoka-Medium", size: 5))
                                        .foregroundColor(Color("Primary"))
                                    
                                    // "06.00 pm" SHOULD BE CHANGABLE
                                    Text("\(calendarManager.formattedTime(date: event.startDate))")
                                        .font(Font.custom("Fredoka-Medium", size: 20))
                                        .foregroundColor(Color("Primary"))
                                    Spacer()
                                }
                                
                                //Content should be changeable
                                VStack(alignment: .leading, spacing: 4){
                                    Text("\(event.title)")
                                        .font(Font.custom("Fredoka-Regular", size: 17))
                                        .foregroundColor(.gray)
                                }
                                
                                VStack(alignment: .leading, spacing: 4){
                                    Text("INVITEES STATUS")
                                        .font(Font.custom("Fredoka-Medium", size: 11))
                                        .foregroundColor(.gray)
                                    
                                    //Member List
                                    Button {
                                        // SHOULD NAVIGATE TO MEMBER DETAILS
                                    } label: {
                                        HStack {
                                            ForEach (0 ..< HpVM.calendars[HpVM.currentCalendar].calendarMembers.count) { users in
                                                if (users < 4) {
                                                    Image(systemName: "person.crop.circle.badge.fill")
                                                        .font(Font.custom("Fredoka-Medium", size: 20))
                                                        .foregroundColor(.green)
                                                }
                                            }
                                        }
                                        
                                        if (HpVM.calendars[HpVM.currentCalendar].calendarMembers.count > 4) {
                                            Text("+\(HpVM.calendars[HpVM.currentCalendar].calendarMembers.count-4)")
                                                .font(Font.custom("Fredoka-Medium", size: 12))
                                                .foregroundColor(.green)
                                        }
                                    }
                                    
                                    
                                }
                                
                                HStack(alignment: .center) {
                                    Button {
                                        //code here
                                    } label: {
                                        Text("Decline")
                                            .frame(minWidth: 125)
                                    }
                                    .buttonStyle(BorderButton())
                                    Spacer()
                                    Button {
                                        //code here
                                    } label: {
                                        Text("Accept")
                                            .frame(minWidth: 125)
                                    }
                                    .buttonStyle(FillButton())
                                }
                                
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                        }
                    }
//                }
                .padding()
            }
        }
    }
        
    
}
