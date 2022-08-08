//
//  TeamData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

class TeamData: ObservableObject, Codable {
    @Published var listOfTeams: Set<Robot>// = [
//        Robot(num: 114, name: "Eaglestrike"),
//        Robot(num: 300, name: "Gears"),
//        Robot(num: 254, name: "Cheesy Poofs")
//    ]
    
    init() {
        self.listOfTeams = []
    }
    
    enum CodingKeys: CodingKey {
        case listOfTeams
    }
    
    required init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        self.listOfTeams = try data.decode(Set<Robot>.self, forKey: .listOfTeams)
        
        for team in listOfTeams {
            if team.scoutingReports.isEmpty {
                listOfTeams.remove(team)
            }
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encode(listOfTeams, forKey: .listOfTeams)
    }
    
    private func addTeam(num: Int, name: String?) -> Robot {
        let insertResult: (Bool, Robot)
        if let n = name {
            insertResult = listOfTeams.insert(Robot(num: num, name: n))
            
        } else {
            insertResult = listOfTeams.insert(Robot(num: num, name: "Team \(num)"))
        }
        return insertResult.1
    }
    
    func findTeam(num: Int) -> Robot {
        let teamFound = listOfTeams.first { Robot in Robot.teamNum == num}
        
        guard let r = teamFound else {
//            print("Robot not found! Creating robot...")
            return addTeam(num: num, name: nil)
        }
//        print(listOfTeams)
        return r
    }
    
    func deleteTeam(number: Int) {
        listOfTeams.remove(findTeam(num: number))
    }
}
