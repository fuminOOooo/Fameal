//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import SwiftUI
import EventKit

struct addCalendarPage: View {
    
    @ObservedObject var CcVM = calendarViewModel()
    @Binding var isCreatingCalendar: Bool
    @Binding var calendarSelection: Bool
    @Binding var selectedCalendar: EKCalendar?
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
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
                    
                    Createcalendarpage1()
                    
                    Createcalendarpage2(CcVM: CcVM, selectedCalendar: self.$selectedCalendar)
                    
                    Spacer()
                    
                    //            Createcalendarpage3()
                    
                }
                .onDisappear{
                    self.calendarSelection = false
                    self.isCreatingCalendar = false
//                    print(selectedCalendar)
                    self.selectedCalendar = selectedCalendar
                    //            self.selectedCalendarIndex = CcVM.getUserCalendars().count-1
            }
            }
        }
    }
}

//struct CN_Previews: PreviewProvider {
//    static var previews: some View {
//        Createcalendarpage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
