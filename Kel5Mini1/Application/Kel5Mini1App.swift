//
//  Kel5Mini1App.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 19/04/23.
//

import SwiftUI

@main
struct Kel5Mini1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Homepage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
