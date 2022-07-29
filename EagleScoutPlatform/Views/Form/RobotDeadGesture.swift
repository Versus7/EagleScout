//
//  RobotDeadGesture.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/21/22.
//

import SwiftUI

struct RobotDeadGesture: View {
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    var tap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in self.tapped = !self.tapped }
    }
    @State var a = ScoutingReport()
    
    // custom view variables
    @State var tapped = false
    @State var timeDead: Double = 0
    @State var climbTime: Double = 0
    
    @State var deadTimerOn: Bool = false
    @State var climberTimerOn: Bool = false
    
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
                    TimerView(fillColor: .red, elapsedTime: $timeDead, descriptor: "Time Dead: ", timerOn: $deadTimerOn, tapped: $tapped)
                        .onReceive(timer) { _ in
                            timeDead += 0.01
                        }
                } else if climberTimerOn {
                    TimerView(fillColor: .blue, elapsedTime: $climbTime, descriptor: "Time to Climb:", timerOn: $climberTimerOn, tapped: $tapped)
                        .onReceive(timer) { _ in
                            climbTime += 0.01
                        }
                } else {
                    // View allowing you to pick from a timer
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
                            TimerOption(imageName: "exclamationmark.triangle.fill", caption: "Time Dead")
                        }.buttonStyle(.plain)

                        Spacer()
                        Button {
                            climberTimerOn = true
                        } label: {
                            TimerOption(imageName: "chart.bar.fill", caption: "Climb Time")
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
