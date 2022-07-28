//
//  RobotDeadGesture.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/21/22.
//

import SwiftUI

struct RobotDeadGesture: View {
    @State var tapped = false
    @State var timeDead: Double = 0
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var tap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in self.tapped = !self.tapped }
    }
    @State var a = ScoutingReport()
    
    // custom view variables
    @State var deadTimerOn: Bool = false
    @State var climberTimerOn: Bool = false
    
    @State var climbTime: Double = 0
    
    var body: some View {
        ZStack {
            ScoutReportView(report: $a)
                .gesture(tap)
                .onChange(of: self.tapped) { newValue in
                    if self.timeDead > 0 {
                        a.dead = true
                        a.timeDead = self.timeDead
                    }
                    if self.climbTime > 0 {
                        a.attemptedClimb = true
                        a.climbTime = self.climbTime
                    }
                }
            if self.tapped {
                if deadTimerOn {
                    Rectangle()
                        .fill(Color.red)
                        .ignoresSafeArea()
//                        .transition(.slide.animation(.linear))
                    VStack {
                        Text("Time Dead:")
                            .font(.title)
                        Text("\(timeDead, specifier: "%.2f")")
                            .monospacedDigit()
                            .font(.largeTitle)
                            .padding()
                            .onReceive(timer) { _ in
                                timeDead += 0.01
                            }
                    }
                    Button {
                        deadTimerOn = false
                        self.tapped = false
                    } label: {
                        VStack {
                            Spacer()
                            Image(systemName: "x.circle")

                                .font(.title2)
                                .padding()
                        }
                    }.buttonStyle(.plain)

                } else if climberTimerOn {
                    Rectangle()
                        .fill(Color.blue)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("Time to Climb:")
                            .font(.title)
                        Text("\(climbTime, specifier: "%.2f")")
                            .monospacedDigit()
                            .font(.largeTitle)
                            .padding()
                            .onReceive(timer) { _ in
                                climbTime += 0.01
                            }
                    }
                    Button {
                        climberTimerOn = false
                        self.tapped = false
                    } label: {
                        VStack {
                            Spacer()
                            Image(systemName: "x.circle")
                                .font(.title2)
                                .padding()
                        }
                    }.buttonStyle(.plain)
                    
                } else {
                    Rectangle()
                        .fill(Color.custom1)
                        .ignoresSafeArea()
                        .gesture(tap)
                        .transition(.scale.animation(.easeIn))
                    HStack {
                        Spacer()
                        Button {
                            deadTimerOn = true
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .opacity(0.5)
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100, alignment: .center)
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.white)
                                        .font(.largeTitle)
                                }
                                Text("Time Dead")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }.buttonStyle(.plain)

                        Spacer()
                        Button {
                            climberTimerOn = true
                        } label: {
                            VStack {
                                ZStack {
                                    Circle()
                                        .opacity(0.5)
                                        .frame(width: 100, height: 100, alignment: .center)
                                        .foregroundColor(.white)
                                    Image(systemName: "chart.bar.fill")
                                        .foregroundColor(Color.white)
                                        .font(.largeTitle)
                                }
                                Text("Climb Time")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            }
                        }.buttonStyle(.plain)

                        Spacer()
                }.transition(.scale.animation(.easeIn))
                // button to exit view
                Button {
                    tapped = false
                } label: {
                    VStack {
                        Spacer()
                        Image(systemName: "x.circle")
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                    }
                }.buttonStyle(.plain)
                }
            }
        }
    }
}

struct RobotDeadGesture_Previews: PreviewProvider {
    static var previews: some View {
        RobotDeadGesture()
            .preferredColorScheme(.dark)
    }
}
