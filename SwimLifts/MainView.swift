//
//  MainView.swift
//  SwimLifts
//
// 


import SwiftUI

struct MainView: View {
    @StateObject private var viewModel: SharedViewModel
    @State private var selectedTab: TabBarItem = .plans

    init(viewModel: SharedViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            TabContent(selectedTab: $selectedTab, viewModel: viewModel)
            CustomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
