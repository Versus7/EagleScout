//
//  MatchData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

struct MatchData {
    // this will be a centralized version of all matches
    let matches: Set<Match>
    
    func getMatches() -> Set<Match> {
        return matches
    }
}
