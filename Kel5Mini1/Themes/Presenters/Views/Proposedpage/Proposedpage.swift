//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import SwiftUI
import CoreData
import EventKit

struct Proposed: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    
    private var items: FetchedResults<Item>
    
    @Binding var events: [EKEvent]

    var body:some View {
        
            VStack {
                
                Proposed1()
                
                Proposed2(events : $events)
                
                Spacer()
                
            }
            .navigationBarTitle("Proposed Event")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }

    
}
