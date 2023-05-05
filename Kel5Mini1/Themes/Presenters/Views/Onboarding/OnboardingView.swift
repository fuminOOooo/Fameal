//
//  OnboardingView.swift
//  Kel5Mini1
//
//  Created by Jonathan Heriyanto on 03/05/23.
//

import SwiftUI
import EventKit

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var CcVM = calendarViewModel()
    @State private var calendars = calendarViewModel().getUserCalendars()
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 34){
                Image("family")
                VStack(alignment: .leading, spacing: 8){
                    Text("We makes your meal-time!")
                        .font(Font.custom("Fredoka-Regular", size: 18))
                        .foregroundColor(.gray)
                    Text("Make your meal-time more enjoyable, continue now!")
                        .font(Font.custom("Fredoka-Medium", size: 26))
                        .foregroundColor(Color("PB-800"))
                    
                    NavigationLink {
                        CreateJoinView(calendars: self.calendars)
                    } label: {
                        Text("Continue")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("Fredoka-Medium", size: 16))
                            .padding()
                            .frame(height: 44)
                            .background(Color("Secondary"))
                            .cornerRadius(6)
                            .foregroundColor(Color(.white))
                    }
                    .padding(.top)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .onDisappear(){
            dismiss()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
