//
//  CreateJoinView.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 03/05/23.
//

import SwiftUI
import EventKit

struct CreateJoinView: View {
    @ObservedObject var CcVM = calendarViewModel()
    
    var adaptiveGridItem = [
        GridItem(.adaptive(minimum: 150), spacing: 5)
    ]
    @State var selectedCalendarIndex: Int = 0
    @State var calendarSelection: Bool = false
    @State private var isCreatingCalendar: Bool = false
    @State private var isPresented = false
//    @Binding var selectedCalendar: EKCalendar?
    @State var calendars: [EKCalendar] = calendarViewModel().getUserCalendars()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 4){
                    //ini harusnya bisa diganti ga si
                    Text("Hi, Dary!")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                        .padding(.top)
                    Text("Create or join calendar")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                    
                    ScrollView{
                        LazyVGrid(columns: adaptiveGridItem, spacing: 20) {
                            NavigationLink {
                                createCalendarPage()
                            } label:{
                                //button create a calendar
                                VStack(spacing: 14){
                                    ZStack{
                                        Image(systemName: "plus.circle.fill")
                                            .font(.system(size: 55))
                                            .foregroundColor(Color("SO-100"))
                                        Image(systemName: "plus")
                                            .font(Font.custom("Fredoka-Bold", size: 35))
                                            .foregroundColor(Color("Secondary"))
                                    }
                                    Text("Create a Calendar")
                                        .font(Font.custom("Fredoka-Medium", size: 16))
                                        .foregroundColor(Color("Secondary"))
                                }
                                .frame(width: 163, height: 163)
                                .background(Color("CCGray"))
                                .cornerRadius(10)
                            }
                            
                            ForEach(calendars, id: \.calendarIdentifier) { calendar in
                                NavigationLink(destination: Homepage(selectedCalendar: calendar)) {
                                    VStack(alignment: .leading, spacing: 4){
                                        Text(calendar.title.dropFirst(9))
                                            .font(Font.custom("Fredoka-Medium", size: 19))
                                            .foregroundColor(Color("PB-800"))
                                        //insyaallah nanti bisa invite family member
                                        Text("count members")
                                            .font(Font.custom("Fredoka-Regular", size: 16))
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                }
                                .padding()
                                .frame(width: 163, height: 163)
                                .background(Color("PB-100"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        self.isPresented.toggle()
                    } label: {
                        Text("How to Join a Calendar?")
                            .frame(maxWidth: .infinity)
                    }.buttonStyle(BorderButton())
                        .padding(.bottom)
                }
                .padding()
                
                if isPresented {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    // Modal View
                    JoinInfoModal(isPresented: $isPresented)
                        .zIndex(1)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            calendars = CcVM.getUserCalendars()
            print(calendars)
        }
    }
}

//struct CreateJoinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateJoinView()
//    }
//}
