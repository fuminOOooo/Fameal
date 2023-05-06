//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import SwiftUI
import EventKit
import CoreData

struct Proposed: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @Binding var selectedCalendar: EKCalendar?

    var body:some View {
        
            VStack {
                
                Proposed1()
                
                Proposed2(selectedCalendar: self.$selectedCalendar)
                
                Spacer()
                
            }
            .navigationBarTitle("Proposed Event")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }

    
}
