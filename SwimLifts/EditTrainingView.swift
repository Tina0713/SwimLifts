//
//  EditTrainingView.swift
//  SwimLifts
//
//

import SwiftUI

struct EditTrainingView: View {
    @Binding var activities: [(String, Int, Int)]
    var trainingName: String
    var onSave: ([(String, Int, Int)]) -> Void

    var body: some View {
        Form {
            Section(header: Text("Training Name")) {
                Text(trainingName)
                    .font(.headline)
            }

            Section(header: Text("Training Activities")) {
                ForEach(activities.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        TextField("Swim Stroke", text: Binding(
                            get: { activities[index].0 },
                            set: { activities[index].0 = $0 }
                        ))

                        HStack {
                            Spacer()
                            Picker("Repetitions", selection: Binding(
                                get: { activities[index].1 },
                                set: { activities[index].1 = $0 }
                            )) {
                                ForEach(1...5, id: \.self) { count in
                                    Text("\(count)").tag(count)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }

                        HStack {
                            Spacer()
                            Picker("Distance", selection: Binding(
                                get: { activities[index].2 },
                                set: { activities[index].2 = $0 }
                            )) {
                                ForEach([25, 50], id: \.self) { distance in
                                    Text("\(distance) meters").tag(distance)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                }

                Button(action: {
                    activities.append(("New Stroke", 1, 25))
                }) {
                    Text("Add Training Activity")
                        .foregroundColor(.blue)
                }
            }

            Button(action: {
                onSave(activities) 
            }) {
                Text("Save")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Edit Training Plan")
        .navigationBarTitleDisplayMode(.inline)
    }
}
