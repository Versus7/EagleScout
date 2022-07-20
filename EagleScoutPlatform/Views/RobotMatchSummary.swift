//
//  RobotMatchSummary.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct RobotMatchSummary: View {
    let autoPoints: Int
    let teleopPoints: Int
    let died: Bool
    // eventually get this data from a ScoutReport instance
    // TODO: Change color of background from gray to something else.
    // TODO: Show the round number here.
    var body: some View {
        GroupBox {
            ZStack {
                HStack {
                    Spacer()
                    Text(String(autoPoints))
                    Spacer()
                    Spacer()
                    Text(String(teleopPoints))
                    Spacer()
                }.font(.largeTitle.bold())
                if died {
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
            HStack {
                Spacer()
                Text("AUTO")
                Spacer()
                Spacer()
                Text("TELEOP")
                Spacer()
            }.font(.caption)
        }.padding(.horizontal)
//        .foregroundColor(.black)
//        .shadow(color: .gray, radius: 1, x: 2, y: 2)
    }
}

struct RobotMatchSummary_Previews: PreviewProvider {
    static var previews: some View {
        RobotMatchSummary(autoPoints: 10, teleopPoints: 50, died: false)
    }
}
