//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import SwiftUI
import CoreData

struct Createcalendarpage: View {
    
    @StateObject var CcVM = calendarViewModel()
    @Binding var isCreatingCalendar: Bool
    @Binding var calendarSelection: Bool
    @Binding var selectedCalendarIndex: Int
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Createcalendarpage1()
            
            Createcalendarpage2(CcVM: CcVM)
            
            Spacer()
            
//            Createcalendarpage3()
            
        }
        .onDisappear{
            self.calendarSelection = false
            self.isCreatingCalendar = false
            self.selectedCalendarIndex = CcVM.getUserCalendars().count-1
        }
    }
}

//struct CN_Previews: PreviewProvider {
//    static var previews: some View {
//        Createcalendarpage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
