//
//  CustomTabBar.swift
//  SwimLifts
//
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabBarItem

    var body: some View {
        HStack {
            ForEach(TabBarItem.allCases, id: \.self) { tab in
                Spacer()
                VStack {
                    Image(systemName: tab.iconName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                    Text(tab.title)
                        .font(.caption)
                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                }
                .onTapGesture {
                    selectedTab = tab
                }
                Spacer()
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
    }
}


// TabBarItem 定義
enum TabBarItem: CaseIterable {
    case plans, history, settings

    var title: String {
        switch self {
        case .plans: return "Plans"
        case .history: return "History"
        case .settings: return "Settings"
        }
    }

    var iconName: String {
        switch self {
        case .plans: return "list.bullet"
        case .history: return "clock"
        case .settings: return "gearshape"
        }
    }
}
