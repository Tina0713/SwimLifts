//
//  HistoryView.swift
//  SwimLifts
//
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: SharedViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.completedPlans, id: \.0) { plan in
                    VStack(alignment: .leading) {
                        Text(plan.0)
                            .font(.headline)
                        Text(plan.1)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        ForEach(plan.2, id: \.0) { activity in
                            HStack {
                                Text(activity.0)
                                Spacer()
                                Text("\(activity.1)x\(activity.2) m")
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("History")
        }
    }
}
