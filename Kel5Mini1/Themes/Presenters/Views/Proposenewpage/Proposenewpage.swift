//
//  Upcomingpage.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 26/04/23.
//

import SwiftUI
import CoreData

struct Proposenewpage: View {
    
    var PnVM: ProposenewViewModel
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body:some View {
        
            VStack {
                
                ProposeNewEventBackButton(PnVM: PnVM)
                
                ProposeNewEventDatePicker(PnVM: PnVM)
                
                ProposeNewTextFields(PnVM: PnVM)
                
                ProposeNewStartTime(PnVM: PnVM)
                
                ProposeNewProposalButton(PnVM: PnVM)
                
                Spacer()
                
            }
            .navigationTitle("Propose New Event")
            .padding()
            .navigationBarBackButtonHidden(true)
    }

    
}
