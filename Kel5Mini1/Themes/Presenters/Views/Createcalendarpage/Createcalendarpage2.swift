//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 30/04/23.
//

import SwiftUI
import EventKit

struct Createcalendarpage2: View {
    
//    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    @State var tempCalendarName: String = ""
    @ObservedObject var CcVM = calendarViewModel()
    @State private var calendars: [EKCalendar] = calendarViewModel().getUserCalendars()
    @Binding var selectedCalendar: EKCalendar?
    @State private var selectedCalendarUID: String?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 24){
            
            // Component 3
            HStack{
                TextField(text: $tempCalendarName, prompt: Text("Add calendar name")){
                    
                }
                .font(Font.custom("Fredoka-Medium", size: 16))
                .foregroundColor(Color("PB-800"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            }
            .padding(.leading)
            .padding(.trailing)
            
            // Component 4
            HStack{
                Button {
                    CcVM.addCalendar(name: "(Fameal) " + tempCalendarName)
                    calendars = CcVM.getUserCalendars()
                    print(calendars.count)
                    selectedCalendarUID = CcVM.getCalendarIdentifier(forTitle: ("(Fameal) " + tempCalendarName)) ?? ""
                    selectedCalendar = CcVM.getCalendar(withIdentifier: selectedCalendarUID ?? "")
//                    print(selectedCalendar)
                    dismiss()
                } label: {
                    if (tempCalendarName == "") {
                        Text("Create Calendar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("SO-100"))
                            .cornerRadius(6)
                            .font(Font.custom("Fredoka-Medium", size: 16))
                    } else {
                        Text("Create Calendar")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color("Secondary"))
                            .cornerRadius(6)
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .frame(maxWidth: .infinity)
                    }
                }
                .disabled(tempCalendarName == "")
                .padding(.leading)
                .padding(.trailing)
            }
        }
    }
}
