//
//  SearchView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct SearchView: View {
    @State var query: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                TextField(text: $query) {
                    Label("Search Here", systemImage: "magnifyingglass")
                }
                    .textFieldStyle(.roundedBorder)
                    .padding()

                List {
                    ForEach(TeamData.listOfTeams.filter {
                        String($0.teamNum).contains(query) || String($0.teamName).contains(query) || query == ""
                    }
                            , id: \.self) { team in
                        NavigationLink {
                            RobotProfile(robot: team)
                        } label: {
                            ResultView(team: team)
                        }
                    }
                }
            }.navigationTitle("Search")
        }
    }
}

struct ResultView: View {
    let team: Robot
    var body: some View {
        HStack {
            Text(String(team.teamNum))
            Text(team.teamName)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
