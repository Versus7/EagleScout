//
//  MatchSummary.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct SmallMatchSummary: View {
    let match: Match
    //TODO: Fix number formatting width
//    numberFormatter.formatWidth = 3
   //TODO: Display which team won
    var body: some View {
        GroupBox {
            VStack {
                HStack {
                    Spacer()
                    Text("Round \(match.roundNumber)")
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text(String(match.redScore))
                            .font(.largeTitle.bold())
                            .foregroundColor(.red)
    //                        .shadow(color: customRed, radius: 1, x: 1, y: 1)
                        ForEach(match.redTeams, id: \.self) { team in
                            Text(String(team.teamNum))
                        }.font(.caption)
                    }
                    Spacer()
                    Image(systemName: "minus")
                        .imageScale(.large)
                    Spacer()
                    VStack {
                        Text(String(match.blueScore))
                            .font(.largeTitle.bold())
                            .foregroundColor(.blue)
    //                        .shadow(color: customBlue, radius: 1, x: 1, y: 1)
                        ForEach(match.blueTeams, id: \.self) { team in
                            Text(String(team.teamNum))
                        }.font(.caption)

                    }
                    Spacer()
                }
            }
        }.padding(.horizontal)

    }
}

struct MatchSummary_Previews: PreviewProvider {
    static var previews: some View {
        SmallMatchSummary(match: Match(redTeams: [Robot(num: 114, name: "Eaglestrike")], blueTeams: [Robot(num: 256, name: "Cheesy Poofs")], redScore: 100, blueScore: 10, round: 14))
    }
}
