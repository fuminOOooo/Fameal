//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 25/04/23.
//

import SwiftUI

struct Upcoming: View {
    
    @Environment(\.managedObjectContext) private var viewContext

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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        Homepage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
