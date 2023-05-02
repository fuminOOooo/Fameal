//
//  ContentView.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 19/04/23.
//

import SwiftUI
import CoreData

struct Homepage: View {
    init() {
        let appearance = UINavigationBarAppearance()
        let customColor = UIColor(named: "PB-800")!
        appearance.titleTextAttributes = [.foregroundColor: customColor, .font: UIFont(name: "Fredoka-Medium", size: 22)!
            ]
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @StateObject var HpVM = HomepageViewModel()
    
    var body:some View {
        
        NavigationView {
            
            VStack {
                HomePageHeader(HpVM: HpVM)
                
                HomePageUpcomingEvent(HpVM: HpVM)
            
                HomePageProposedEvent(HpVM: HpVM)
                    .padding(.top)
                
                Spacer()
                
            }
            .padding(24)
        }
        .navigationBarBackButtonHidden(true)
    }

    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Homepage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
