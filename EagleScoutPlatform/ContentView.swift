//
//  ContentView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = appViewModel()
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environmentObject(viewModel.teamData)
//            Text("Submit a Scouting Report")
            // TODO: Change ScoutReportView to show past reviews and a button to add a new review
//            RobotDeadGesture()
            ScoutReportView(report: $viewModel.currentScoutReport)
                .tabItem {
                    Label("Scout", systemImage: "plus.circle")
                }
                .environmentObject(viewModel.teamData)
                .environmentObject(viewModel.scoutData)
            PastScouts()
                .tabItem {
                    Label("Past Reports", systemImage: "text.book.closed.fill")
                }
                .environmentObject(viewModel.scoutData)
                .environmentObject(viewModel.teamData)
                
            Text("Upcoming Teams to Scout")
//            Color.custom1
//            SubmitLabels()
                .tabItem {
                    Label("Upcoming", systemImage: "checklist")
                }
        }
    }
}

extension Color {
    static var custom1 = Color(red: 16.0/255.0, green: 45.0/255.0, blue: 180.0/255.0)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
