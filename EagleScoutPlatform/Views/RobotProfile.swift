//
//  RobotProfile.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct RobotProfile: View {
    let robot: Robot
    @State var personal: Bool = true
    var body: some View {
        VStack {
            HStack {
            Text("Team \(robot.teamNum)")
                .font(.title2)
                .foregroundColor(.gray)
                .padding(.horizontal)
                Spacer()
            }
//                Spacer()
//                ForEach(robot.matches, id: \.self) { match in
//                    RobotMatchSummary(match: match)
//                }
            Picker("", selection: $personal) {
                Text("Personal Contributions").tag(true)
                Text("Recent Matches").tag(false)
            }
            .padding(.top)
                .pickerStyle(.segmented)
            if personal {
                ScrollView {
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
                    RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)

                }
            } else {
//                    ForEach(robot.matches, id: \.self) { match in
//                        SmallMatchSummary(match: match)
//                    }
                ScrollView {
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                    SmallMatchSummary(match: Match(redTeams: [], blueTeams: [], redScore: 10, blueScore: 20, round: 6))
                }
            }
            Spacer()
        }
            .navigationTitle(robot.teamName)
    }
}

struct RobotProfile_Previews: PreviewProvider {
    static var previews: some View {
        RobotProfile(robot: Robot(num: 114, name: "Test"))
    }
}
