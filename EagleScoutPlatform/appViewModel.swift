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
}
