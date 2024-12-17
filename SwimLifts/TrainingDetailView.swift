//
//  TrainingDetailView.swift
//  SwimLifts
//
//

import SwiftUI

struct TrainingDetailView: View {
    let trainingName: String
    @Binding var date: String
    @Binding var activities: [(String, Int, Int)]

    @State private var completedSets: [Int]

    init(trainingName: String, date: Binding<String>, activities: Binding<[(String, Int, Int)]>) {
        self.trainingName = trainingName
        self._date = date
        self._activities = activities
        self._completedSets = State(initialValue: Array(repeating: 0, count: activities.wrappedValue.count))
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(trainingName)
                    .font(.headline)
                Spacer()
            }
            .padding()

            HStack {
                Text("Date:")
                    .font(.headline)
                Spacer()
                TextField("Enter date", text: $date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
            }
            .padding()

            ScrollView {
                ForEach(activities.indices, id: \.self) { index in
                    VStack {
                        HStack {
                            Text(activities[index].0)
                                .font(.body)
                            Spacer()
                            Text("\(activities[index].1) sets * \(activities[index].2) meters")
                                .font(.subheadline)
                        }
                        .padding(.vertical, 5)

                        HStack(spacing: 10) {
                            ForEach(0..<activities[index].1, id: \.self) { setIndex in
                                Button(action: {
                                    completedSets[index] = setIndex + 1
                                }) {
                                    Circle()
                                        .stroke(
                                            completedSets[index] > setIndex ? Color.red : Color.gray,
                                            lineWidth: 3
                                        )
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Text("\(setIndex + 1)")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        )
                                        .background(
                                            completedSets[index] > setIndex ? Color.red : Color.clear
                                        )
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .padding(.horizontal)
                }
            }

            NavigationLink(
                destination: EditTrainingView(
                    activities: $activities,
                    trainingName: trainingName,
                    onSave: { updatedActivities in
                        self.activities = updatedActivities
                        self.completedSets = Array(repeating: 0, count: updatedActivities.count)
                    }
                )
            ) {
                Text("Edit")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
}
