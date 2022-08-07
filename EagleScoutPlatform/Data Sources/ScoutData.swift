//
//  ScoutData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/27/22.
//

import Foundation

class ScoutData: ObservableObject, Codable {
    @Published var pastScoutingReports: [ScoutingReport]// = [
//    ScoutingReport(),
//    ScoutingReport(),
//    ScoutingReport()
//    ]
    
    enum CodingKeys: CodingKey {
        case pastScoutingReports
    }
    
    init() {
        self.pastScoutingReports = []
    }
    
    required init(from decoder: Decoder) throws {
        let decoded = try decoder.container(keyedBy: CodingKeys.self)
        pastScoutingReports = try decoded.decode([ScoutingReport].self, forKey: .pastScoutingReports)
    }
    
    func encode(to encoder: Encoder) throws {
        var encoderContainer = encoder.container(keyedBy: CodingKeys.self)
        try encoderContainer.encode(pastScoutingReports, forKey: .pastScoutingReports)
        
    }
    
    
    func addScout(report: ScoutingReport) {
        pastScoutingReports.append(report)
    }
}
