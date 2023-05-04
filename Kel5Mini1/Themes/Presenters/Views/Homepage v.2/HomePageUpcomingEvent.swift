//
//  Homepage2.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 22/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct HomePageUpcomingEvent: View {
    
    @ObservedObject var HpVM = HomepageViewModel()
    
    var body: some View {
        VStack{
            //upcoming navigation
            HStack{
                Text ("UPCOMING EVENT")
                    .font(Font.custom("Fredoka-Medium", size: 14))
                    .foregroundColor(Color("Gray3"))
                Spacer()
                NavigationLink {
                    Upcoming()
                } label: {
                    Text ("See all")
                        .font(Font.custom("Fredoka", size: 16))
                        .foregroundColor(Color("Secondary"))
                }
            }
            .padding(.top)
            
            //card
            VStack(alignment: .leading, spacing: 14){
                HStack{
                    
                    // "Monday, 17 Apr" SHOULD BE CHANGABLE
                    Text("Monday, 17 Apr")
                        .font(Font.custom("Fredoka-Medium", size: 20))
                        .foregroundColor(Color("Primary"))
                    
                    Image(systemName: "circle.fill")
                        .font(Font.custom("Fredoka-Medium", size: 5))
                        .foregroundColor(Color("Primary"))
                    
                    // "06.00 pm" SHOULD BE CHANGABLE
                    Text("06.00 pm")
                        .font(Font.custom("Fredoka-Medium", size: 20))
                        .foregroundColor(Color("Primary"))
                    Spacer()
                }
                
                //Content should be changeable
                VStack(alignment: .leading, spacing: 4){
                    Text("It's Mealtime!")
                        .font(Font.custom("Fredoka-Medium", size: 17))
                    .foregroundColor(Color("Grey"))
                    
                    Text("This iftar, Dary will pay for everything!")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                    .foregroundColor(.gray)
                }
                
                
                HStack(alignment: .center) {
                    NavigationLink {
                        //code here
                        GameRulesView()
                    } label: {
                        Text("Find Topic 🤩")
                            .frame(minWidth: 300)
                    }
                .buttonStyle(FillButton())
                }
                
            }
            .padding()
            .background(Color("PB-100"))
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 1, y: 2)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomePageUpcomingEvent().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
