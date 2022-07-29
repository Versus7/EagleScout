//
//  ScoutingReport.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

struct ScoutingReport: Hashable, Identifiable {
    var id = UUID()
    
    var timeSubmitted: Date = .distantFuture
    
    var teamNumber: Int = 0
    var roundNumber: Int = 0
    
    var dead: Bool = false
    var timeDead: Double = 0.0
    
    var autoMovement: Bool = false
    // TODO: Implement getters and setters that return the following values as nil if there was no auto movement
    var autoLow: Int = 0
    var autoHigh: Int = 0
    var autoDescription: String = ""
    
    var teleopLow: Int = 0
    var teleopHigh: Int = 0
    var teleopDescription: String = ""
    
    var attemptedClimb: Bool = false
    var climbHeight: ClimbLevel = .failed
    var climbTime: Double = 0.0
    
    var matchDescription: String = ""
    
    var speed: SpeedResult = .slower
    var driverSkill: Double = 0
    var gameComments: String = ""
    
    var isFilledOut: Bool {
        teamNumber != 0 && roundNumber != 0
    }
    
    var isLegalInput: Bool {
        (0...9999).contains(teamNumber) && (0...150).contains(roundNumber)
    }
    
//    static var LegalInput: (Int, Int) -> { (num1, num2) in
//        (0...9999).contains(num1) && (0...150).contains(num2)
//    }
}
