//
//  RobotMatchSummary.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct RobotMatchSummary: View {
    let scout: ScoutingReport
    // TODO: Change color of background from gray to something else.
    // TODO: Show a circle filled with how the percentage of the match the robot was dead
    // TODO: Take a hint from Scrumdinger, maybe design these without using GroupBoxes.
    var body: some View {
        GroupBox {
            ZStack {
                HStack {
                    Spacer()
                    Text(String(scout.autoLow + scout.autoHigh))
                    Spacer()
                    Spacer()
                    Text(String(scout.teleopLow + scout.teleopHigh))
                    Spacer()
                }.font(.largeTitle.bold())
                if scout.dead {
                    HStack {
                        Spacer()
                        Image(systemName: "x.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
        } label: {
            VStack {
                Text("Round \(scout.roundNumber)")
                HStack {
                    Spacer()
                    Text("AUTO")
                    Spacer()
                    Spacer()
                    Text("TELEOP")
                    Spacer()
                }.font(.caption)
            }
        }.padding(.horizontal)
//        .foregroundColor(.black)
//        .shadow(color: .gray, radius: 1, x: 2, y: 2)
    }
}

struct RobotMatchSummary_Previews: PreviewProvider {
    static let a = ScoutingReport()
    static var previews: some View {
        RobotMatchSummary(scout: a)
    }
}
