//
//  ScoutReportView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ScoutReportView: View {
    @Binding var report: ScoutingReport
    
    // temp variables
    @State private var showingSubmitAlert: Bool = false
    
    @EnvironmentObject var teamData: TeamData
    @EnvironmentObject var scoutData: ScoutData
    
    @FocusState private var teamNumIsFocused: Bool
    @FocusState private var roundNumIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                // Background Information
                BackgroundSection(reportRoundNumber: $report.roundNumber, reportTeamNumber: $report.teamNumber)
                
                // Auto Information
                AutoSection(autoMovement: $report.autoMovement, low: $report.autoLow, high: $report.autoHigh, description: $report.autoDescription)
                
                // Teleop Information
                Section {
                    RoundStageInfo(low: $report.teleopLow, high: $report.teleopHigh, description: $report.teleopDescription, roundType: "Teleop")
                    VStack {
                        Text("Shot accuracy: \(Int(report.teleopShotAccuracy))%").padding(.top)
                            .font(.headline)
                        Slider(value: $report.teleopShotAccuracy, in: 0...100) {
                            Text("OK")
                        } minimumValueLabel: {
                            Text("0")
                        } maximumValueLabel: {
                            Text("100")
                        }
                    }

                } header: {
                    Label("TELEOP", systemImage: "gamecontroller.fill")
                }
                
                // Endgame information
                EndgameSection(attemptedClimb: $report.attemptedClimb, climbHeight: $report.climbHeight, climbTime: $report.climbTime, climbComments: $report.climbComments)
                
                // TODO: Convert death to a gesture
                if (report.dead) {
                    Section {
                            HStack {
                                Text("Time Dead: ")
                                Text("\(report.timeDead, specifier: "%.2f")")
                                    .monospacedDigit()
                            }
                            .font(.title2)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                    } header: {
                        Text("DEATH")
                    }
                }
                
                // Overview
                RobotOverviewSection(speed: $report.speed, driverSkill: $report.driverSkill)
                
                Button("Submit") {
                    report.timeSubmitted = .now
                    let associatedRobot = teamData.findTeam(num: report.teamNumber)
                    associatedRobot.addScout(report: report)
                    scoutData.addScout(report: report)
                    report = ScoutingReport()
//                    teamNum = ""
//                    roundNum = ""
                    showingSubmitAlert = true
                }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.automatic)
                    .disabled(!report.isLegalInput || !report.isFilledOut)
                if (!report.isLegalInput || !report.isFilledOut) {
                    if (report.isFilledOut) {
                       Text("Please correct your round or team number input.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Please fill out round number and team number before submitting.")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                        
                    }
//                        .frame(maxWidth: .infinity)
                    
                }
            }
            .navigationTitle("Round #\(report.roundNumber)")
        }.alert(Text("Thanks for submitting!"), isPresented: $showingSubmitAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}


struct ScoutReportView_Previews: PreviewProvider {
    @State static var a = ScoutingReport()
    static var previews: some View {
        ScoutReportView(report: $a)
            .preferredColorScheme(.light)
    }
}
