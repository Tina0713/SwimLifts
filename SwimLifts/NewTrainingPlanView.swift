//
//  NewTrainingPlanView.swift
//  SwimLifts
//
//

import SwiftUI

struct NewTrainingPlanView: View {
    @Environment(\.presentationMode) var presentationMode 
    @State private var trainingName: String = ""
    @State private var trainingDate: String = ""
    @State private var activities: [(String, Int, Int)] = []

    var onSave: ((String, String, [(String, Int, Int)])) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Training Plan Name")) {
                    TextField("Enter training plan name", text: $trainingName)
                }

                Section(header: Text("Date")) {
                    TextField("Enter date (e.g., December 20)", text: $trainingDate)
                }

                Section(header: Text("Training Activities")) {
                    ForEach(activities.indices, id: \.self) { index in
                        HStack {
                            TextField("Stroke", text: Binding(
                                get: { activities[index].0 },
                                set: { activities[index].0 = $0 }
                            ))
                            TextField("Repetitions", value: Binding(
                                get: { activities[index].1 },
                                set: { activities[index].1 = $0 }
                            ), formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                            TextField("Distance (meters)", value: Binding(
                                get: { activities[index].2 },
                                set: { activities[index].2 = $0 }
                            ), formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                        }
                    }
                    Button(action: {
                        activities.append(("New Stroke", 1, 25)) 
                    }) {
                        Text("Add Training Activity")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationBarTitle("Add New Training Plan", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                if !trainingName.isEmpty && !trainingDate.isEmpty {
                    onSave((trainingName, trainingDate, activities))
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}
