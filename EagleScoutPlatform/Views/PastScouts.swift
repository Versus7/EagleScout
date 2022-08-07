//
//  PastScouts.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/27/22.
//

import SwiftUI

struct PastScouts: View {
//    @EnvironmentObject var scoutReports: ScoutData
//    @EnvironmentObject var teamData: TeamData
    @EnvironmentObject var viewModel: appViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.scoutData.pastScoutingReports.sorted(by: { r, a in
                    r.roundNumber > a.roundNumber
                }), id:\.self) { report in
                    NavigationLink {
                        ExpandedRobotMatchSummary(scout: report)
                            .environmentObject(viewModel.teamData)
                    } label: {
                        HStack(spacing: 0) {
                            Group {
                                Text("#")
                                    .padding(.bottom)
                                    .foregroundColor(.gray)
                                Text("\(report.roundNumber)")
                                    .monospacedDigit()
                                    .font(.title2)
                                    .bold()
                                    .frame(minWidth: 40)
                                    .padding(.trailing)
                            }
                            Text("\(viewModel.teamData.findTeam(num: report.teamNumber).teamName)")
                        }
                        .padding()
                    }
                }.onDelete { viewModel.scoutData.pastScoutingReports.remove(atOffsets: $0)
                    try! viewModel.save()
                    
                }
            }.navigationTitle("Past Reports")
        }
    }
}

struct PastScouts_Previews: PreviewProvider {
    static var previews: some View {
        PastScouts()
            .preferredColorScheme(.dark)
            .environmentObject(ScoutData())
            .environmentObject(TeamData())
    }
}
