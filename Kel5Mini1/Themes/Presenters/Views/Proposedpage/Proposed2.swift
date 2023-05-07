//
//  Upcoming2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import Foundation
import SwiftUI
import EventKit
import CoreData

struct Proposed2: View {
    
    @ObservedObject var EM = EventManager()
    @State var events = [EKEvent]()
    @Binding var selectedCalendar: EKCalendar?
    
    
    var body: some View {
        ScrollView (.vertical){
            ForEach(events, id: \.eventIdentifier){ event in
                VStack(alignment: .leading, spacing: 14){
                    HStack{
                        // "Monday, 17 Apr" SHOULD BE CHANGABLE
                        Text(EM.formattedDate(date: event.startDate))
                            .font(Font.custom("Fredoka-Medium", size: 20))
                            .foregroundColor(Color("Primary"))
                        
                        Image(systemName: "circle.fill")
                            .font(Font.custom("Fredoka-Medium", size: 5))
                            .foregroundColor(Color("Primary"))
                        
                        // "06.00 pm" SHOULD BE CHANGABLE
                        Text(EM.formattedTime(date: event.startDate))
                            .font(Font.custom("Fredoka-Medium", size: 20))
                            .foregroundColor(Color("Primary"))
                        Spacer()
                    }
                    
                    //Content should be changeable
                    VStack(alignment: .leading, spacing: 4){
                        Text(event.title!)
                            .font(Font.custom("Fredoka-Medium", size: 17))
                            .foregroundColor(Color("Grey"))
                        
                        Text(event.notes!)
                            .font(Font.custom("Fredoka-Regular", size: 17))
                            .foregroundColor(.gray)
                    }
                }
                .frame(minWidth: 320)
                .padding()
                .background(.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                .padding(.top, 14)
            }
            .padding()
        }
        .onAppear{
            events = EM.getAllEvents(from: selectedCalendar!)
        }
    }
}
