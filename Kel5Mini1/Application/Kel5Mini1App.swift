//
//  Kel5Mini1App.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 19/04/23.
//

import SwiftUI

@main
struct Kel5Mini1App: App {
    
    @StateObject var calendarManager : CalendarManager = CalendarManager()
    
    init() {
        let appearance = UINavigationBarAppearance()
        let customColor = UIColor(named: "PB-800")!
        appearance.titleTextAttributes = [.foregroundColor: customColor, .font: UIFont(name: "Fredoka-Medium", size: 18)!
            ]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            OnboardingView(CalendarManager: calendarManager)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
