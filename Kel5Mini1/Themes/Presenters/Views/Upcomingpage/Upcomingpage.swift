//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 25/04/23.
//

import SwiftUI
import CoreData

struct Upcoming: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body:some View {
        
            VStack {
                
                Upcoming1()
                
                Upcoming2()
                
                Spacer()
                
            }
            .padding()
            .navigationBarTitle("Upcoming Event")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Homepage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
