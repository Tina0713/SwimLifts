//
//  SwimLiftsApp.swift
//  SwimLifts
//
//

import SwiftUI

@main
struct SwimLiftsApp: App {
    @StateObject private var sharedViewModel = SharedViewModel() 

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: sharedViewModel)
        }
    }
}
