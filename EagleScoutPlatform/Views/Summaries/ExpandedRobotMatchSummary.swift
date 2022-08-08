//
//  ExpandedRobotMatchSummary.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/23/22.
//

import SwiftUI

struct ExpandedRobotMatchSummary: View {
    // TODO: Add teleop, auto, climb, match descriptions here
    // TODO: Fix climbing UI
    // TODO: (In the future) Show tags
    let scout: ScoutingReport
    @EnvironmentObject var teamData: TeamData
    var body: some View {
//        NavigationView {
            Form {
                HStack {
                    Text("\(teamData.findTeam(num: scout.teamNumber).teamName)")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    Spacer()
                }

                // Background Information
                Section {
                    Text("Time Submitted: \(scout.timeSubmitted.formatted())")
                    GroupBox {
                        HStack {
                            Spacer()
                            Text("\(scout.roundNumber)")
                                .monospacedDigit()
                                .font(.largeTitle.bold())
                            Spacer()
                            Spacer()
                            Text("\(scout.teamNumber)")
                                .monospacedDigit()
                                .font(.largeTitle.bold())
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
                            Label("No Auto Movement", systemImage: "x.circle")
                                .foregroundColor(.red)
                                .font(.headline)
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
                                .font(.headline)
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
                    HStack {
                        Text("Driver skill:")
                            .font(.title2)
                            .padding()
//                            .frame(maxWidth: .infinity)
                        Group {
                            Text(String(Int(scout.driverSkill)))
                                .bold()
                                .padding(.bottom)
                            Text("/")
                                .bold()
                            Text("5")
                                .bold()
                                .padding(.top)
                        }.font(.title)
                            .foregroundColor({
                                switch(Int(scout.driverSkill)) {
                                case 0, 1:
                                    return Color.red
                                case 2:
                                    return Color.orange
                                case 3:
                                    return Color.yellow
                                case 4, 5:
                                    return Color.green
                                default:
                                    return Color.black
                                }
                            }())
                    }.frame(maxWidth: .infinity)
//                        .foregroundStyle(LinearGradient(colors: [Color.custom1,.blue], startPoint: .leading, endPoint: .trailing))
//                    Slider(value: $report.driverSkill, in: 0...5, step: 1)
                    
                } header: {
                    Label("OVERVIEW", systemImage: "book.closed.fill")
                }
//            }
            .navigationTitle("Round #\(scout.roundNumber)")
        }
    }
}
struct ExpandedRobotMatchSummary_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedRobotMatchSummary(scout: ScoutingReport())
            .environmentObject(TeamData())
    }
}
