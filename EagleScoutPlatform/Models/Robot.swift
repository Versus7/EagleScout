//
//  Robot.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

class Robot: Hashable, Identifiable, Codable {
    static func == (lhs: Robot, rhs: Robot) -> Bool {
        lhs.teamNum == rhs.teamNum
    }
    
    let teamNum: Int
    let teamName: String
    // configure image property later
    var description: String? = ""
    var matches: [Match] = []
    var scoutingReports: [ScoutingReport] = []
    
    init(num: Int, name: String) {
        self.teamNum = num
        self.teamName = name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(teamNum)
        hasher.combine(description)
        hasher.combine(teamName)
        hasher.combine(matches)
    }
    
    func addMatch(match: Match) {
        matches.append(match)
    }
    
    func addScout(report: ScoutingReport) {
        scoutingReports.append(report)
    }
}
