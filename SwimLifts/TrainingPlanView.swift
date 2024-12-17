//
//  TrainingPlanView.swift
//  SwimLifts
//
//

import SwiftUI

struct TrainingPlanView: View {
    @ObservedObject var viewModel: SharedViewModel
    @State private var showingNewPlanSheet = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.trainingPlans.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(viewModel.trainingPlans[index].0)
                                        .font(.headline)
                                    Text(viewModel.trainingPlans[index].1)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top)

                            Divider()

                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(viewModel.trainingPlans[index].2, id: \.0) { activity in
                                    HStack {
                                        Text(activity.0)
                                            .font(.body)
                                        Spacer()
                                        Text("\(activity.1)x\(activity.2) m")
                                            .font(.body)
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)

                            Divider()

                            HStack {
                                Button(action: {
                                    let completedPlan = viewModel.trainingPlans.remove(at: index)
                                    viewModel.completedPlans.append(completedPlan)
                                }) {
                                    Text("Completed")
                                        .font(.subheadline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }

                                NavigationLink(
                                    destination: TrainingDetailView(
                                        trainingName: viewModel.trainingPlans[index].0,
                                        date: $viewModel.trainingPlans[index].1,
                                        activities: $viewModel.trainingPlans[index].2
                                    )
                                ) {
                                    Text("Start")
                                        .font(.subheadline)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom)
                        }
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                    }
                }

                Button(action: {
                    showingNewPlanSheet = true
                }) {
                    Label("Add New Training Plan", systemImage: "plus.circle")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
                
                }
            }
            .navigationTitle("SwimLift")
            .sheet(isPresented: $showingNewPlanSheet) {
                NewTrainingPlanView { newPlan in
                    viewModel.trainingPlans.append(newPlan)
                }
            }
        }
    }
}
