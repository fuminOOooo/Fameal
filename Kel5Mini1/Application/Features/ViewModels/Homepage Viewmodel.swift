//
//  Proposenew Viewmodel.swift
//  Kel5Mini1
//
//  Created by Elvis Susanto on 29/04/23.
//

import Foundation
import Combine

class HomepageViewModel: ObservableObject {
    
    // For choosing which calendar should be selected
    
    @Published var currentCalendar: Int = 0
    
    @Published var calendarsAreShown: Bool = false
    
}
