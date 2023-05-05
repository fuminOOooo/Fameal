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
    init() {
        let appearance = UINavigationBarAppearance()
        let customColor = UIColor(named: "PB-800")!
        appearance.titleTextAttributes = [.foregroundColor: customColor, .font: UIFont(name: "Fredoka-Medium", size: 18)!
        ]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
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
