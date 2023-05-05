//
//  Kel5Mini1App.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 19/04/23.
//

import SwiftUI
import AuthenticationServices

@main
struct Kel5Mini1App: App {
    @StateObject var calendarManager : CalendarManager = CalendarManager()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //LoginView()
            
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(calendarManager)
           // ContentView()
        }
    }
}
