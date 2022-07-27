//
//  ScoutData.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/27/22.
//

import Foundation

class ScoutData: ObservableObject {
    @Published var pastScoutingReports: [ScoutingReport] = [
    ScoutingReport(),
    ScoutingReport(),
    ScoutingReport()
    ]
    
    
    func addScout(report: ScoutingReport) {
        pastScoutingReports.append(report)
    }
}
