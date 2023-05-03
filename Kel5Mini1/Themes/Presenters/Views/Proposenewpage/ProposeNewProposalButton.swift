//
//  Homepage1.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 02/05/23.
//

import Foundation
import SwiftUI
import CoreData

struct ProposeNewProposalButton: View {
    
    @State var temporarySelectedTime = Date()
    
    @State var temporaryUsers: [String] = ["Hai", "Halo", "Hey", "Hello", "Ola"]
    
    @ObservedObject var PnVM : ProposenewViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Button {
                
            } label: {
                Text("Propose Event")
                    .frame(minWidth: 317)
            }
            .buttonStyle(FillButton())
        }
        .padding()
    }
}
