//
//  MatchData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

struct MatchData {
    // this will be a centralized version of all matches
    let matches: [Match] = [
        Match(redTeams: [TeamData.listOfTeams[0]], blueTeams: [TeamData.listOfTeams[1]], redScore: 10, blueScore: 100, round: 2)
    ]
    
    func getMatches() -> [Match] {
        return matches
    }
}
