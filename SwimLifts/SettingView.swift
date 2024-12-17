//
//  SettingsView.swift
//  SwimLifts
//
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                
                
                Section(header: Text("App Information")) {
                    NavigationLink(destination: Text("Introduce the App")) {
                        Text("Introduce the App")
                    }
                    NavigationLink(destination: Text("Rate the App")) {
                        Text("Rate the App")
                    }
                }
                
                Section(header: Text("Feedback and Tracking")) {
                    NavigationLink(destination: Text("Submit Feedback")) {
                        Text("Feedback")
                    }
                    NavigationLink(destination: Text("Analytics and Tracking")) {
                        Text("Analytics")
                    }
                    NavigationLink(destination: Text("Report a Crash")) {
                        Text("Crash Report")
                    }
                    NavigationLink(destination: Text("Manage Tracking")) {
                        Text("Tracking")
                    }
                }
                
                Section(header: Text("Legal and Privacy")) {
                    NavigationLink(destination: Text("Terms and Conditions")) {
                        Text("Terms and Conditions")
                    }
                    NavigationLink(destination: Text("Privacy Policy")) {
                        Text("Privacy Policy")
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
