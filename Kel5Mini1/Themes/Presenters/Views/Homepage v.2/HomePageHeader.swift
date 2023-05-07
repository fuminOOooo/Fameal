//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 21/04/23.
//

import SwiftUI
import EventKit

struct HomePageHeader: View {
    @ObservedObject var HpVM = HomepageViewModel()
    @ObservedObject var CcVM = calendarViewModel()
    @ObservedObject var EM = EventManager()
    @State var events = [EKEvent]()
    @State var allEvents = [EKEvent]()
    @State var calendarSelection: Bool = false
    @State private var isCreatingCalendar: Bool = false
    @Binding var selectedCalendar: EKCalendar?
    @State private var calendars: [EKCalendar] = calendarViewModel().getUserCalendars()
    
    var body: some View {
        VStack (spacing: 4) {
            HStack {
                Button {
                    calendars = CcVM.getUserCalendars()
                    print(calendars)
                    calendarSelection.toggle()
                } label: {
                    Text(((selectedCalendar?.title.dropFirst(9) ?? "")!))
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
                            ForEach(calendars, id: \.calendarIdentifier) { calendar in
                                Button  {
                                    selectedCalendar = calendar
                                    calendarSelection.toggle()
                                } label: {
                                    HStack {
                                        VStack {
                                            HStack {
                                                Text (calendar.title.dropFirst(9))
                                                    .font(Font.custom("Fredoka-Medium", size: 20))
                                                Spacer()
                                            }
                                        }
                                        .padding(.leading)
                                        
                                        if (selectedCalendar == calendar) {
                                            VStack {
                                                Image(systemName: "checkmark")
                                                    .bold()
                                                    .padding(.trailing)
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: 340, minHeight: 80)
                                .background(selectedCalendar == calendar ? Color("PB-50") : Color(.white))
                                .cornerRadius(8)
                                .foregroundColor(Color("PB-800"))
                                .padding(.leading)
                                .padding(.trailing)
                                
                                if (calendars.count != 1) {
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
                                .frame(height:64)
                        }.sheet(isPresented: self.$isCreatingCalendar) {
                            addCalendarPage(isCreatingCalendar: self.$isCreatingCalendar, calendarSelection: self.$calendarSelection, selectedCalendar: self.$selectedCalendar)
                        }
                    }
                    .presentationDetents([.medium])
                })
                
                Spacer()
                
                //Add Event Button
                NavigationLink {
                    Proposenewpage(selectedCalendar: self.$selectedCalendar)
                } label: {
                    Image(systemName: "plus")
                        .font(Font.custom("Fredoka-Bold", size: 24))
                        .foregroundColor(Color("PB-800"))
                        .bold()
                }
            }
            .padding(.top)
            
            //UPCOMING EVENT
            VStack{
                HStack{
                    Text ("UPCOMING EVENT")
                        .font(Font.custom("Fredoka-Medium", size: 14))
                        .foregroundColor(Color("Gray3"))
                    Spacer()
                }
                .padding(.top)
                
                //card
                if(!events.isEmpty){
                    VStack(alignment: .leading, spacing: 14){
                        HStack{
                            // "Monday, 17 Apr" SHOULD BE CHANGABLE
                            Text(EM.formattedDate(date: events[0].startDate))
                                .font(Font.custom("Fredoka-Medium", size: 20))
                                .foregroundColor(Color("Primary"))
                            
                            Image(systemName: "circle.fill")
                                .font(Font.custom("Fredoka-Medium", size: 5))
                                .foregroundColor(Color("Primary"))
                            
                            // "06.00 pm" SHOULD BE CHANGABLE
                            Text(EM.formattedTime(date: events[0].startDate))
                                .font(Font.custom("Fredoka-Medium", size: 20))
                                .foregroundColor(Color("Primary"))
                            Spacer()
                        }
                        
                        //Content should be changeable
                        VStack(alignment: .leading, spacing: 4){
                            Text(events[0].title!)
                                .font(Font.custom("Fredoka-Medium", size: 17))
                                .foregroundColor(Color("Grey"))
                            
                            Text(events[0].notes!)
                                .font(Font.custom("Fredoka-Regular", size: 17))
                                .foregroundColor(.gray)
                        }
                        
                        HStack(alignment: .center) {
                            NavigationLink {
                                //code here
                                GameRulesView()
                            } label: {
                                Text("Find Topic 🤩")
                                    .frame(minWidth: 290)
                            }
                            .buttonStyle(FillButton())
                        }
                        
                    }
                    .padding()
                    .background(Color("PB-100"))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                } else {
                    // if there's no event
                    VStack(alignment: .leading, spacing: 14){
                        HStack(){
                            Spacer()
                            Image("calfill")
                            Spacer()
                        }
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("You don't have any upcoming event yet!")
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .foregroundColor(Color("Primary"))
                        }
                    }
                    .padding()
                    .background(Color("PB-100"))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                }
            }
            .padding(.top, 14)
            
            //PROPOSED EVENT
            VStack{
                HStack{
                    Text ("PROPOSED EVENT")
                        .font(Font.custom("Fredoka-Medium", size: 14))
                        .foregroundColor(Color("Gray3"))
                    Spacer()
                    if(events.count > 2){
                        NavigationLink {
                            Proposed(selectedCalendar: self.$selectedCalendar)
                        } label: {
                            Text ("See all (\(events.count))")
                                .font(Font.custom("Fredoka", size: 16))
                                .foregroundColor(Color("Secondary"))
                        }
                    }
                }
                .padding(.top)
                
                if(!events.isEmpty){
                    VStack(spacing: 18){
                        VStack(alignment: .leading, spacing: 14){
                            HStack{
                                // "Monday, 17 Apr" SHOULD BE CHANGABLE
                                Text(EM.formattedDate(date: allEvents[0].startDate))
                                    .font(Font.custom("Fredoka-Medium", size: 20))
                                    .foregroundColor(Color("Primary"))
                                
                                Image(systemName: "circle.fill")
                                    .font(Font.custom("Fredoka-Medium", size: 5))
                                    .foregroundColor(Color("Primary"))
                                
                                // "06.00 pm" SHOULD BE CHANGABLE
                                Text(EM.formattedTime(date: allEvents[0].startDate))
                                    .font(Font.custom("Fredoka-Medium", size: 20))
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                            
                            //Content should be changeable
                            VStack(alignment: .leading, spacing: 4){
                                Text(allEvents[0].title!)
                                    .font(Font.custom("Fredoka-Medium", size: 17))
                                    .foregroundColor(Color("Grey"))
                                
                                Text(allEvents[0].notes!)
                                    .font(Font.custom("Fredoka-Regular", size: 17))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(minWidth: 320)
                        .padding()
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                        
                        if(events.count>1){
                            VStack(alignment: .leading, spacing: 14){
                                HStack{
                                    // "Monday, 17 Apr" SHOULD BE CHANGABLE
                                    Text(EM.formattedDate(date: allEvents[1].startDate))
                                        .font(Font.custom("Fredoka-Medium", size: 20))
                                        .foregroundColor(Color("Primary"))
                                    
                                    Image(systemName: "circle.fill")
                                        .font(Font.custom("Fredoka-Medium", size: 5))
                                        .foregroundColor(Color("Primary"))
                                    
                                    // "06.00 pm" SHOULD BE CHANGABLE
                                    Text(EM.formattedTime(date: allEvents[1].startDate))
                                        .font(Font.custom("Fredoka-Medium", size: 20))
                                        .foregroundColor(Color("Primary"))
                                    Spacer()
                                }
                                
                                //Content should be changeable
                                VStack(alignment: .leading, spacing: 4){
                                    Text(allEvents[1].title!)
                                        .font(Font.custom("Fredoka-Medium", size: 17))
                                        .foregroundColor(Color("Grey"))
                                    
                                    Text(allEvents[1].notes!)
                                        .font(Font.custom("Fredoka-Regular", size: 17))
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(minWidth: 320)
                            .padding()
                            .background(.white)
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
                        }
                        
                    }
                } else{
                    // if there's no event
                    VStack(alignment: .leading, spacing: 14){
                        HStack(){
                            Spacer()
                            Image("calendar")
                            Spacer()
                        }
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("You don't have any proposed event yet!")
                                .font(Font.custom("Fredoka-Medium", size: 18))
                                .foregroundColor(Color("Primary"))
                            Text("Propose a new event for your family?")
                                .font(Font.custom("Fredoka-Regular", size: 16))
                                .foregroundColor(.gray)
                        }
                        
                        HStack(alignment: .center) {
                            NavigationLink{
                                Proposenewpage(selectedCalendar: self.$selectedCalendar)
                            } label: {
                                Text("Propose a new event")
                                    .frame(minWidth: 290)
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
            .padding(.top, 14)
        }
        .onAppear(){
            refreshView()
            print("Result" + (selectedCalendar?.title ?? ""))
        }
        .onChange(of: selectedCalendar) { _ in
            refreshView()
            print("Result" + (selectedCalendar?.title ?? ""))
        }
    }
    
    private func refreshView() {
        //Fetch events for the selected calendar
        if let calendar = selectedCalendar {
            events = EM.getSpecificCalendarEvents(from: calendar)
            allEvents = EM.getAllEvents(from: calendar)
        }
    }
}
