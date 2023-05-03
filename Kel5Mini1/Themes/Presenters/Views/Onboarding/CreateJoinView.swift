//
//  CreateJoinView.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 03/05/23.
//

import SwiftUI

struct CreateJoinView: View {
    @ObservedObject var CcVM = calendarViewModel()
    
    //ini cuman buat preview aja
    @ObservedObject var HpVM = HomepageViewModel()
    var adaptiveGridItem = [
        GridItem(.adaptive(minimum: 150), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 4){
                //ini harusnya bisa diganti ga si
                Text("Hi, Dary!")
                    .font(Font.custom("Fredoka-Medium", size: 26))
                    .foregroundColor(Color("PB-800"))
                    .padding(.top)
                Text("Create or join calendar")
                    .font(Font.custom("Fredoka-Medium", size: 26))
                    .foregroundColor(Color("PB-800"))
                
                LazyVGrid(columns: adaptiveGridItem, spacing: 10) {
                    VStack(spacing: 14){
                        ZStack{
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 55))
                                .foregroundColor(Color("SO-100"))
                            Image(systemName: "plus")
                                .font(.system(size: 55))
                                .foregroundColor(Color("Secondary"))
                        }
                        Text("Create a Calendar")
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .foregroundColor(Color("Secondary"))
                    }
                    .frame(width: 163, height: 163)
                    .background(Color("PB-50"))
                    .cornerRadius(10)
                    
                    ForEach(0..<HpVM.calendars.count){ i in
                        VStack{
                            Text("\(HpVM.calendars[i].calendarName)")
                                .frame(minWidth: 150)
                                .background(.blue)
                            Spacer()
                        }
                    }
                    /*ForEach(0..<CcVM.getUserCalendars().count){ calendars in
                     Text("\(CcVM.getUserCalendars()[calendars].title)")
                     
                     }*/
                }
                .padding(.top)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .onAppear{
            CcVM.getUserCalendars()
        }
    }
}

struct CreateJoinView_Previews: PreviewProvider {
    static var previews: some View {
        CreateJoinView()
    }
}
