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
    
    var body: some View {
        ZStack {
            ScoutReportView(report: ScoutingReport())
                .gesture(tap)
            if self.tapped {
                Rectangle()
                    .fill(Color.red)
                    .gesture(tap)
                    .transition(.scale.animation(.easeIn))
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
                }.transition(.scale.animation(.easeIn))
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
