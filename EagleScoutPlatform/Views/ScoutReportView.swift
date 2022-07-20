//
//  ScoutReportView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/14/22.
//

import SwiftUI

struct ScoutReportView: View {
    @State var report: ScoutingReport
    @State var teamNum: String = ""
    @State var roundNum: String = ""
    
    // temp variables
    @State var autoShots: Double = 0.0
    
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
                            Spacer()
                            Spacer()
                            TextField("#000", text: $teamNum)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.center)
                                .onChange(of: teamNum) { newValue in
                                    report.teamNumber = Int(teamNum) ?? 0
                                }
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
                    .foregroundColor(report.legalBackgroundInfo ? .primary : .red)
                    if (!report.legalBackgroundInfo) {
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
                    if (report.autoMovement) {
                        ScoreStepper(score: $report.autoLow, name: "Low")
                        ScoreStepper(score: $report.autoHigh, name: "High")
                        TextField(text: $report.autoDescription) {
                            Text("Auto Description")
                        }

                    }
                } header: {
                    Label("AUTO", systemImage: "desktopcomputer")
                }
                
                // Teleop Information
                Section {
                    ScoreStepper(score: $report.teleopLow, name: "Low")
                    ScoreStepper(score: $report.teleopHigh, name: "High")
                    TextField(text: $report.teleopDescription) {
                        Text("Teleop Description")
                    }

                } header: {
                    Label("TELEOP", systemImage: "gamecontroller.fill")
                }
                
                Section {
                    Toggle(isOn: $report.attemptedClimb) {
                        Text("Attempted climb?")
                    }
                    
                    if (report.attemptedClimb) {
                        Picker("Climb level", selection: $report.climbHeight) {
                            Text("Traversal").tag(ClimbLevel.traversal)
                            Text("High").tag(ClimbLevel.high)
                            Text("Mid").tag(ClimbLevel.mid)
                            Text("Low").tag(ClimbLevel.low)
                            Text("Failed").tag(ClimbLevel.failed)
                            
                        }.pickerStyle(.menu)
                            .frame(maxWidth: .infinity)
                        Slider(value: $report.climbTime, in: 0...195)
                        Text("Time to climb: \(Int(report.climbTime)) seconds")
                    }
                } header: {
                    Label("ENDGAME", systemImage: "forward.fill")
                }
                
                // TODO: Convert death to a gesture
                Section {
                    Toggle(isOn: $report.dead, label: {
                        Text("Did they die?")
                    })
                    if (report.dead) {
                        Slider(value: $report.timeDead, in: 0...195)
                            .tint(report.timeDead > 130 ? Color.red : report.timeDead > 65 ? Color.orange: Color.green)
                        Text(String(Int(report.timeDead)))
                            .multilineTextAlignment(.center)
                    }
                } header: {
                    Text("DEATH")
                    // convert death to a gesture on the screen, maybe a double tap
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
                
                Button("Submit") {}
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.automatic)
                    .disabled(!report.isComplete)
                if (!report.isComplete) {
                    Text("Please fill out round number and team number before submitting.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
//                        .frame(maxWidth: .infinity)
                    
                }
            }
            .navigationTitle("Round #\(report.roundNumber)")
        }
    }
}

struct ScoreStepper: View {
    @Binding var score: Int
    var name: String
    var body: some View {
        Stepper("\(name) Shots: \(score)") {
            score += 1
        } onDecrement: {
            if (score > 0) {
                score -= 1
            }
        }
    }
}

struct ScoutReportView_Previews: PreviewProvider {
    static var previews: some View {
        ScoutReportView(report: ScoutingReport())
            .preferredColorScheme(.dark)
    }
}
