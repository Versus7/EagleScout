//
//  TeamData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

struct TeamData {
    static var listOfTeams: Set<Robot> = [
        Robot(num: 114, name: "Eaglestrike"),
        Robot(num: 300, name: "Gears"),
        Robot(num: 254, name: "Cheesy Poofs")
    ]
    
    static private func addTeam(num: Int, name: String?) -> Robot {
        let insertResult: (Bool, Robot)
        if let n = name {
            insertResult = TeamData.listOfTeams.insert(Robot(num: num, name: n))
            
        } else {
            insertResult = TeamData.listOfTeams.insert(Robot(num: num, name: "Team \(num)"))
        }
        return insertResult.1
    }
    
    static func findTeam(num: Int) -> Robot {
        let teamFound = TeamData.listOfTeams.first { Robot in Robot.teamNum == num}
        
        guard let r = teamFound else {
            print("Robot not found! Creating robot...")
            return addTeam(num: num, name: nil)
        }
        print(listOfTeams)
        return r
    }
}
