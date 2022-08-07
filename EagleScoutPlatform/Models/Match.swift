//
//  Match.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

class Match: Hashable, Codable {
    static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.redTeams == rhs.redTeams
    }
    
    let redTeams: [Robot]
    let blueTeams: [Robot]
    let redScore: Int
    let blueScore: Int
    let roundNumber: Int
    var winner: RoundResult {
        if redScore > blueScore {
            return RoundResult.red
        } else if blueScore > redScore {
            return RoundResult.blue
        } else {
            return RoundResult.tie
        }
    }
    // configure tournament property later
    
    init(redTeams: [Robot], blueTeams: [Robot], redScore: Int, blueScore: Int, round: Int) {
        self.redTeams = redTeams
        self.blueTeams = blueTeams
        self.redScore = redScore
        self.blueScore = blueScore
        self.roundNumber = round
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(redTeams)
        hasher.combine(blueTeams)
        hasher.combine(redScore)
        hasher.combine(blueScore)
        hasher.combine(roundNumber)
        hasher.combine(winner)
        
    }
}
