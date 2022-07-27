//
//  ScoutReportView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ScoutReportView: View {
    @Binding var report: ScoutingReport
    @State var teamNum: String = ""
    @State var roundNum: String = ""
    
    // temp variables
    @State var autoShots: Double = 0.0
    
    @State var isShowingTeleopSheet: Bool = false
    
    @EnvironmentObject var teamData: TeamData
    @EnvironmentObject var scoutData: ScoutData
    
    @FocusState private var teamNumIsFocused: Bool
    @FocusState private var roundNumIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                // Background Information
                Section {
                    GroupBox {
                        HStack {
                            Spacer()
                            TextField("000", text: $roundNum)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .onChange(of: roundNum) {
                                    newValue in
                                    report.roundNumber = Int(roundNum) ?? 0
                                }
                                .focused($roundNumIsFocused)
                            Spacer()
                            Spacer()
                            TextField("#000", text: $teamNum)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .onChange(of: teamNum) { newValue in
                                    report.teamNumber = Int(teamNum) ?? 0
                                }
                                .focused($teamNumIsFocused)
                            Spacer()
                        }
                        .font(.title)
                    } label: {
                        HStack {
                            Spacer()
                            Text("Round Number")
                            Spacer()
                            Spacer()
                            Text("Team Number")
                            Spacer()
                        }
                        .font(.caption)
                    }
                    .foregroundColor(report.isLegalInput ? .primary : .red)
                    if (!report.isLegalInput) {
                        Text("Error: Bad Input")
                            .font(.caption)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                    }

                } header: {
                    Label("BACKGROUND", systemImage: "magnifyingglass")
                }
                
                // Auto Information
                Section {
                    Toggle(isOn: $report.autoMovement, label: {
                        Text("Did they move during auto?")
                    })
                    .onTapGesture {
                        teamNumIsFocused = false
                    }
                    if (report.autoMovement) {
                        RoundStageInfo(low: $report.autoLow, high: $report.autoHigh, description: $report.autoDescription, roundType: "Auto")
                    }
                } header: {
                    Label("AUTO", systemImage: "desktopcomputer")
                }
                
                // Teleop Information
                Section {
                    RoundStageInfo(low: $report.teleopLow, high: $report.teleopHigh, description: $report.teleopDescription, roundType: "Teleop")
                } header: {
                    Label("TELEOP", systemImage: "gamecontroller.fill")
                }
                
                // Endgame information
                Section {
                    Toggle(isOn: $report.attemptedClimb) {
                        Text("Attempted climb?")
                    }
                    
                    if (report.attemptedClimb) {
                        Menu {
                            Button("Traversal") {
                                report.climbHeight = .traversal
                            }
                            
                            Button("High") {
                                report.climbHeight = .high
                            }
                            
                            Button("Mid") {
                                report.climbHeight = .mid
                            }
                            
                            Button("Low") {
                                report.climbHeight = .low
                            }
                        } label: {
                            Text("Robot Climb: \(report.climbHeight.rawValue)")
                        }
                        
                        Slider(value: $report.climbTime, in: 0...195)
                        Text("Time to climb: \(Int(report.climbTime)) seconds")
                    }
                } header: {
                    Label("ENDGAME", systemImage: "forward.fill")
                }
                
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
                Section {
                    Text("Speed (compared to our robot)")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                    Picker("", selection: $report.speed) {
                        Text("Slower").tag(SpeedResult.slower)
                        Text("Equal").tag(SpeedResult.equal)
                        Text("Faster").tag(SpeedResult.faster)
                    }
                    .pickerStyle(.segmented)
                    Text("Driver skill: \(Int(report.driverSkill))")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                    Slider(value: $report.driverSkill, in: 0...5, step: 1)
                    
                } header: {
                    Label("OVERVIEW", systemImage: "book.closed.fill")
                }
                
                Button("Submit") {
                    report.timeSubmitted = .now
                    let associatedRobot = teamData.findTeam(num: report.teamNumber)
                    associatedRobot.addScout(report: report)
                    scoutData.addScout(report: report)
                    report = ScoutingReport()
                    teamNum = ""
                    roundNum = ""
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
