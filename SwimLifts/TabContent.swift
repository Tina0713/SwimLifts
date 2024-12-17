//
//  TabContent.swift
//  SwimLifts
//
//

import SwiftUI

struct TabContent: View {
    @Binding var selectedTab: TabBarItem
    @ObservedObject var viewModel: SharedViewModel

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case .plans:
                TrainingPlanView(viewModel: viewModel)
            case .history:
                HistoryView(viewModel: viewModel)
            case .settings:
                SettingsView()
            }
        }
    }
}
