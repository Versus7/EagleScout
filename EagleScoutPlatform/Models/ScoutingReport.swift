//
//  ScoutingReport.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import Foundation

struct ScoutingReport: Hashable, Identifiable, Codable {
    var id = UUID()
    var user: String = "" // will hold the email address of the person who submit the form
    var timeSubmitted: Date = .distantFuture
    
    var teamNumber: Int = 0
    var roundNumber: Int = 0
    
    var dead: Bool = false
    var timeDead: Double = 0.0
    
    // auto
    var autoMovement: Bool = false
    // TODO: Implement getters and setters that return the following values as nil if there was no auto movement
    var autoLow: Int = 0
    var autoHigh: Int = 0
    var autoDescription: String = ""
    
    // teleop
    var teleopLow: Int = 0
    var teleopHigh: Int = 0
    var teleopShotAccuracy: Double = 0.0
    var teleopDescription: String = ""
    
    // endgame
    var attemptedClimb: Bool = false
    var climbHeight: ClimbLevel = .failed
    var climbTime: Double = 0.0
    var climbComments: String = ""
    
    // general
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
