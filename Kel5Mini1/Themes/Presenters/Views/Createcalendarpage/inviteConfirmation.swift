//
//  inviteGuide.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 07/05/23.
//

import SwiftUI
import EventKit

struct inviteConfirmation: View {
    @State var selectedCalendar: EKCalendar?
    @State private var confirmStatus: Bool = false
    
    var body: some View {
        VStack (alignment: .leading){
            Image("inviteaset")
            Text("How to invite family")
                .font(Font.custom("Fredoka-Medium", size: 26))
                .foregroundColor(Color("PB-800"))
            Text("members to your calendar?")
                .font(Font.custom("Fredoka-Medium", size: 26))
                .foregroundColor(Color("PB-800"))
            
            VStack(alignment: .leading, spacing: 24){
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("1")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    Text("Open the “Calendar“ app")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("2")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    Text("Tap “Calendars“ tab at the bottom")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("3")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    
                    Text("Select your “Fameal” calendar")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("4")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    
                    Text("Tap “Add Person”")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("5")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    
                    Text("Input your family member email")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Circle().fill(Color("Secondary"))
                            .frame(height: 24)
                        Text("6")
                            .foregroundColor(.white)
                            .font(Font.custom("Fredoka-Regular", size: 14))
                    }
                    
                    Text("Tap “Add“ to invite them")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
                
                HStack(spacing: 6){
                    ZStack{
                        Image(systemName: "checkmark.circle.fill")
                            .font(Font.custom("Fredoka-Bold", size: 23))
                            .foregroundColor(.green)
                    }
                    
                    Text("Done!")
                        .font(Font.custom("Fredoka-Regular", size: 17))
                        .foregroundColor(Color("PB-800"))
                }
            }
            .padding(.top)
            
            Spacer()
            
            NavigationLink {
                Homepage(selectedCalendar: selectedCalendar)
            } label: {
                Text("I've invite my family")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(FillButton())
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

