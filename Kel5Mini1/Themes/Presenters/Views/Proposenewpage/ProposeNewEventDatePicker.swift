//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 28/04/23.
//

import Foundation
import SwiftUI
import CoreData

struct ProposeNewEventDatePicker: View {
    
    @State var viewSelectedDate: Date = Date()
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    @ObservedObject var PnVM : ProposenewViewModel
    
    var body: some View {
        VStack () {
            
            //Component 2
            DatePicker("Select a date", selection: $viewSelectedDate, in: Date()..., displayedComponents: .date)
                .padding(6)
                .cornerRadius(10)
                .datePickerStyle(.graphical)
                .colorScheme(.light)
                .accentColor(Color("PB-800"))
                .onChange(of: viewSelectedDate) { newValue in
                    PnVM.selectedDate = newValue
                    print(PnVM.selectedDate)
                }
            
            HStack {
                //Component 3
                Text("\(viewSelectedDate, formatter: DateFormatter().dateFormat())")
                    .font(Font.custom("Fredoka-Medium", size: 20))
                    .foregroundColor(Color("PB-800"))
                Spacer()
                
            }
            .padding(.init(top: 6, leading: 6, bottom: 0, trailing: 6))
        }
    }
}

extension DateFormatter {
    func dateFormat() -> DateFormatter {
        self.dateStyle = .long
        return self
    }
}
