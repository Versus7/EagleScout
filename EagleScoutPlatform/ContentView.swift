//
//  ContentView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
//            Text("Submit a Scouting Report")
            // TODO: Change ScoutReportView to show past reviews and a button to add a new review
            ScoutReportView(report: ScoutingReport())
                .tabItem {
                    Label("Scout", systemImage: "plus.circle")
                }
            Text("Upcoming Teams to Scout")
                .tabItem {
                    Label("Upcoming", systemImage: "checklist")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
