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
    
    // custom view variables from former RobotDeadGesture
    @State var tapped = false
    @State var deadTimerOn: Bool = false
    @State var climberTimerOn: Bool = false
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    
    var body: some View {
        NavigationView {
            ZStack {
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
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            tapped.toggle()
                        } label: {
                            Label("Timer", systemImage: "timer")
                        }.onChange(of: self.tapped) { newValue in
                            if report.timeDead > 0 {
                                report.dead = true
                            }
                            if report.climbTime > 0 {
                                report.attemptedClimb = true
                            }
                        }
                    }
                }
                .navigationTitle("Round #\(report.roundNumber)")
                if self.tapped {
                    if deadTimerOn {
                        TimerView(fillColor: .red, elapsedTime: $report.timeDead, descriptor: "Time Dead: ", timerOn: $deadTimerOn, tapped: $tapped)
                            .onReceive(timer) { _ in
                                report.timeDead += 0.01
                            }
                    } else if climberTimerOn {
                        TimerView(fillColor: .blue, elapsedTime: $report.climbTime, descriptor: "Time to Climb:", timerOn: $climberTimerOn, tapped: $tapped)
                            .onReceive(timer) { _ in
                                report.climbTime += 0.01
                            }
                    } else {
                        Group {
                            // View allowing you to pick from a timer
                            Rectangle()
                                .fill(Color.custom1)
                                .ignoresSafeArea()
                            HStack {
                                Spacer()
                                Button {
                                    deadTimerOn = true
                                } label: {
                                    TimerOption(imageName: "exclamationmark.triangle.fill", caption: "Time Dead")
                                }.buttonStyle(.plain)

                                Spacer()
                                Button {
                                    climberTimerOn = true
                                } label: {
                                    TimerOption(imageName: "chart.bar.fill", caption: "Climb Time")
                                }.buttonStyle(.plain)

                                Spacer()
                            }
                        // button to exit view
                        Button {
                            tapped = false
                        } label: {
                            GeometryReader { reader in
                                VStack {
                                    Spacer()
                                    Image(systemName: "x.circle")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .frame(width: reader.size.width, height: 70, alignment: .center)
    //                                    .padding()
                                        .contentShape(Rectangle())
                                }
                            }
                        }.buttonStyle(.plain)
                        }.transition(.scale(scale: 0, anchor: .topTrailing).animation(.easeInOut(duration: 0.5)))
                        
                    }
                }
            }
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
