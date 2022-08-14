//
//  ContentView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = appViewModel()
    @State var welcomeScreen: Bool = true
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
                .environmentObject(viewModel)
//                .environmentObject(viewModel.teamData)
//                .environmentObject(viewModel.scoutData)
            PastScouts()
                .tabItem {
                    Label("Past Reports", systemImage: "text.book.closed.fill")
                }
                .environmentObject(viewModel)
//                .environmentObject(viewModel.scoutData)
//                .environmentObject(viewModel.teamData)
                
            Text("Upcoming Teams to Scout")
//            Color.custom1
//            SubmitLabels()
                .tabItem {
                    Label("Upcoming", systemImage: "checklist")
                }
        }.onAppear {
            try! viewModel.load()
        }
        .sheet(isPresented: $welcomeScreen) {
            GeometryReader { reader in
                VStack(alignment: .center, spacing: 0) {
                    Text("Welcome to EagleScout")
                            .font(.title)
                            .foregroundColor(Color.custom1)
                            .bold()
                            .padding()
                    FeatureRow(imageName: "wifi.slash", title: "Offline First. Always.", description: "You never need a wifi connection to make and save scouting reports.", maxWidth: reader.size.width*0.6)
                        .padding(.vertical)
                    FeatureRow(imageName: "slider.horizontal.3", title: "UI that makes sense", description: "Our intuitive UI is so good, you won't even need to look down when tallying a robot's score.", maxWidth: reader.size.width*0.6)
                        .padding(.vertical)
                    FeatureRow(imageName: "person.circle", title: "Robot Profiles", description: "Everything you need to know about a robot, in one place. What's not to love?", maxWidth: reader.size.width*0.6)
                        .padding(.vertical)
                    FeatureRow(imageName: "list.number", title: "Upcoming Matches", description: "Never miss a scouting match again with our list of upcoming matches you need to scout.", maxWidth: reader.size.width*0.6)
                        .padding(.vertical)
                    Spacer()
                    Button {
                       welcomeScreen = false
                    } label: {
                        Text("Ready?")
                            .font(.title2)
                            .padding()
                            .frame(minWidth: reader.size.width*0.8)
                    }.buttonBorderShape(.capsule)
                        .buttonStyle(.borderedProminent)
                        .frame(maxWidth: .infinity)
                }
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
            .preferredColorScheme(.light)
    }
}
