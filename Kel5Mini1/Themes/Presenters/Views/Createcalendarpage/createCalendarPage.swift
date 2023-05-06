//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import SwiftUI
import EventKit

struct createCalendarPage: View {
    
    @ObservedObject var CcVM = calendarViewModel()
    @State private var selectedCalendar: EKCalendar?
    @State var tempCalendarName: String = ""
    @State private var calendars: [EKCalendar] = calendarViewModel().getUserCalendars()
    @State private var selectedCalendarUID: String?
    @State private var createdCalendar: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        if(!createdCalendar){
            ZStack {
                VStack {
                    HStack{
                        Spacer()
                        Image("cCAsset")
                            .scaleEffect(1.2)
                            .padding(.top, 44)
                            .padding(.trailing, 14)
                    }
                    .zIndex(0)
                    VStack {
                        Spacer()
                        VStack (spacing: 4) {
                            HStack {
                                Text("Create your calendar")
                                    .font(Font.custom("Fredoka-Regular", size: 18))
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                            HStack {
                                Text("Start organizing your family meal time easily!")
                                    .font(Font.custom("Fredoka-Medium", size: 26))
                                    .foregroundColor(Color("PB-800"))
                                Spacer()
                            }
                        }
                        .padding(.leading)
                        .padding(.trailing)
                        
                        VStack(spacing: 24){
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

                            HStack{
                                Button {
                                    CcVM.addCalendar(name: "(Fameal) " + tempCalendarName)
                                    calendars = CcVM.getUserCalendars()
                                    print(calendars.count)
                                    selectedCalendarUID = CcVM.getCalendarIdentifier(forTitle: ("(Fameal) " + tempCalendarName)) ?? ""
                                    selectedCalendar = CcVM.getCalendar(withIdentifier: selectedCalendarUID ?? "")
//                                    print(selectedCalendar)
                                    self.createdCalendar.toggle()
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
                        Spacer()
                        
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(Font.custom("Fredoka-Bold", size: 14))
                                .foregroundColor(Color("PB-800"))
                                .padding(.leading)
                        }
                    
                }
            }
        }
        else {
            Homepage(selectedCalendar: selectedCalendar)
        }
    }
}

//struct CN_Previews: PreviewProvider {
//    static var previews: some View {
//        Createcalendarpage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
