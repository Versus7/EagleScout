//
//  ExpandedRobotMatchSummary.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/23/22.
//

import SwiftUI

struct ExpandedRobotMatchSummary: View {
    let scout: ScoutingReport
    var body: some View {
        NavigationView {
            Form {
                // Background Information
                Section {
                    GroupBox {
                        HStack {
                            Spacer()
                            Text("\(scout.roundNumber)")
                                .monospacedDigit()
                            Spacer()
                            Spacer()
                            Text("\(scout.teamNumber)")
                                .monospacedDigit()
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

                } header: {
                    Label("BACKGROUND", systemImage: "magnifyingglass")
                }
                
                // Auto Information
                Section {
                    if (scout.autoMovement) {
                        GroupBox {
                            ZStack {
                                HStack {
                                    Spacer()
                                    Text(String(scout.autoLow))
                                        .monospacedDigit()
                                    Spacer()
                                    Spacer()
                                    Text(String(scout.autoHigh))
                                        .monospacedDigit()
                                    Spacer()
                                }.font(.largeTitle.bold())
                            }
                        } label: {
                            HStack {
                                Spacer()
                                Text("LOW")
                                Spacer()
                                Spacer()
                                Text("HIGH")
                                Spacer()
                            }.font(.caption)
                        }.padding(.horizontal)
                        if scout.autoDescription != "" {
                            GroupBox {
                                Text(scout.autoDescription)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    } else {
                        GroupBox {
                            HStack {
                                Image(systemName: "x.circle")
                                Text("No auto movement")
                            }.foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                        }
                    }
                } header: {
                    Label("AUTO", systemImage: "desktopcomputer")
                }
                
                // Teleop Information
                Section {
                    GroupBox {
                        ZStack {
                            HStack {
                                Spacer()
                                Text(String(scout.teleopLow))
                                    .monospacedDigit()
                                Spacer()
                                Spacer()
                                Text(String(scout.teleopHigh))
                                    .monospacedDigit()
                                Spacer()
                            }.font(.largeTitle.bold())
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("LOW")
                            Spacer()
                            Spacer()
                            Text("HIGH")
                            Spacer()
                        }.font(.caption)
                    }.padding(.horizontal)
                    if scout.teleopDescription != "" {
                        GroupBox {
                            Text(scout.teleopDescription)
                                .frame(maxWidth: .infinity)
                        }
                    }

                } header: {
                    Label("TELEOP", systemImage: "gamecontroller.fill")
                }
                
                Section {
                    if (scout.attemptedClimb) {
                        if (scout.climbHeight == .failed) {
                            GroupBox {
                                Label("Failed climb", systemImage: "x.circle")
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity)
                            }
                        } else {
                            GroupBox {
                                HStack {
                                    Text("Climbed to")
                                    Text("\(scout.climbHeight.rawValue)")
                                    Text("in \(scout.climbTime) seconds.")
                                }
                            }
                        }
                        Text("Time to climb: \(Int(scout.climbTime)) seconds")
                    } else {
                        GroupBox {
                            Label("Did not attempt to climb", systemImage: "x.circle")
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                        }
                    }
                } header: {
                    Label("ENDGAME", systemImage: "forward.fill")
                }
                
                // TODO: Convert death to a gesture
                if (scout.dead) {
                    Section {
                            HStack {
                                Text("Time Dead: ")
                                Text("\(scout.timeDead, specifier: "%.2f")")
                                    .monospacedDigit()
                            }
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                    } header: {
                        Text("DEATH")
                    }
                }
                
                // Overview
                Section {
                    switch(scout.speed) {
                        case .equal:
                            HStack {
                                Text("Equal")
                                    .foregroundColor(.gray)
                                    .bold()
                                Text("speed as our robot.")
                            }.frame(maxWidth: .infinity)
                            .font(.title2)
                        case .faster:
                            HStack {
                                Text("Faster")
                                    .foregroundColor(.green)
                                    .bold()
                                Text("than our robot")
                            }.frame(maxWidth: .infinity)
                            .font(.title2)
                        case .slower:
                            HStack {
                                Text("Slower")
                                    .foregroundColor(.red)
                                    .bold()
                                Text("than our robot")
                            }.frame(maxWidth: .infinity)
                            .font(.title2)
                    }
                    Text("Speed (compared to our robot)")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
//                    Picker("", selection: $report.speed) {
//                        Text("Slower").tag(SpeedResult.slower)
//                        Text("Equal").tag(SpeedResult.equal)
//                        Text("Faster").tag(SpeedResult.faster)
//                    }
                    .pickerStyle(.segmented)
                    Text("Driver skill: \(Int(scout.driverSkill))")
                        .font(.caption)
                        .frame(maxWidth: .infinity)
//                    Slider(value: $report.driverSkill, in: 0...5, step: 1)
                    
                } header: {
                    Label("OVERVIEW", systemImage: "book.closed.fill")
                }
            }
            .navigationTitle("Round #\(scout.roundNumber)")
        }
    }
}
struct ExpandedRobotMatchSummary_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedRobotMatchSummary(scout: ScoutingReport())
    }
}
