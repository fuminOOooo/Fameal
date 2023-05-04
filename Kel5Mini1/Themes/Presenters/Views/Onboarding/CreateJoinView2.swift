//
//  CreateJoinView.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 03/05/23.
//

import SwiftUI

struct CreateJoinView2: View {
    @ObservedObject var CcVM = calendarViewModel()
    //ini cuman buat preview aja
    @ObservedObject var HpVM = HomepageViewModel()
    
    @State var selectedCalendarIndex: Int = 0
    @State var calendarSelection: Bool = false
    @State private var isCreatingCalendar: Bool = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 4){
                    //ini harusnya bisa diganti ga si
                    Text("Hi, Dary!")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                        .padding(.top)
                    Text("Create or join calendar")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                    Spacer()
                    
                    ScrollView(){
                        VStack(alignment: .leading, spacing: 24){
                            ForEach(0..<HpVM.calendars.count){ i in
                                HStack (alignment: .center){
                                    VStack(alignment: .leading){
                                        Text(HpVM.calendars[i].calendarName)
                                            .font(Font.custom("Fredoka-Medium", size: 24))
                                            .foregroundColor(Color("PB-800"))
                                        Text("\(HpVM.calendars[i].calendarMembers.count) members")
                                            .font(Font.custom("Fredoka-Regular", size: 18))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(Font.custom("Fredoka-Medium", size: 24))
                                        .foregroundColor(Color("PB-800"))
                                    
                                }
                                .padding()
                                .frame(width: 387, height: 100)
                                .background(Color("PB-50"))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.top)
                }
                Spacer()
            }
            VStack(spacing: 14){
                NavigationLink {
                    Createcalendarpage(isCreatingCalendar: self.$isCreatingCalendar, calendarSelection: self.$calendarSelection, selectedCalendarIndex: self.$selectedCalendarIndex)
                } label: {
                    Text("Create a calendar")
                }
                
            }
        }
        .padding()
    }
}

struct CreateJoinView2_Previews: PreviewProvider {
    static var previews: some View {
        CreateJoinView2()
    }
}
