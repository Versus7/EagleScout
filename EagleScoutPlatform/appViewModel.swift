//
//  appViewModel.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 8/7/22.
//

import Foundation

// Single source of truth for the whole app

class appViewModel: ObservableObject {
    @Published var teamData = TeamData()
    @Published var scoutData = ScoutData()
    @Published var currentScoutReport = ScoutingReport()
    
    func deleteScoutingReport(at index: IndexSet) {
        let reportTeam = scoutData.pastScoutingReports[index.first!].teamNumber
        let round = scoutData.pastScoutingReports[index.first!].roundNumber
        
        scoutData.pastScoutingReports.remove(atOffsets: index)
        teamData.findTeam(num: reportTeam).scoutingReports.removeAll { a in
            a.roundNumber == round
        }
        
        if teamData.findTeam(num: reportTeam).scoutingReports.isEmpty {
            teamData.deleteTeam(number: reportTeam)
            print("Team deleted!")
        }
        
    }
    
    // persistence code
    private var eaglescoutDiretory: URL {
        try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    private var teamDataURL: URL {
        eaglescoutDiretory
            .appendingPathComponent("eaglescout-teamdata")
            .appendingPathExtension(for: .json)
    }
    
    private var scoutDataURL: URL {
        eaglescoutDiretory
            .appendingPathComponent("eaglescout-scoutdata")
            .appendingPathExtension(for: .json)
    }
    
    func save() throws {
        let data = try JSONEncoder().encode(teamData)
        try data.write(to: teamDataURL)
        let scoutData = try JSONEncoder().encode(scoutData)
        try scoutData.write(to: scoutDataURL)
    }
    
    func load() throws {
        guard FileManager.default.isReadableFile(atPath: teamDataURL.path) else { return }
        guard FileManager.default.isReadableFile(atPath: scoutDataURL.path) else { return }
        
        let teamDataDecoded = try Data(contentsOf: teamDataURL)
        self.teamData = try JSONDecoder().decode(TeamData.self, from: teamDataDecoded)
        
        let scoutDataDecoded = try Data(contentsOf: scoutDataURL)
        self.scoutData = try JSONDecoder().decode(ScoutData.self, from: scoutDataDecoded)
    }
}
