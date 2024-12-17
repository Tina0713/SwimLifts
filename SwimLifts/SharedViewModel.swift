//
//  SharedViewModel.swift
//  SwimLifts
//
//

import SwiftUI

class SharedViewModel: ObservableObject {
    @Published var trainingPlans: [(String, String, [(String, Int, Int)])] = [
        ("Training Plan A", "December 14", [
            ("Freestyle", 5, 25),
            ("Breaststroke", 5, 50),
            ("Backstroke", 5, 25)
        ]),
        ("Training Plan B", "December 16", [
            ("Freestyle", 5, 25),
            ("Breaststroke", 5, 50),
            ("Butterfly", 4, 50)
        ])
    ]
    
    @Published var completedPlans: [(String, String, [(String, Int, Int)])] = [] 
}
