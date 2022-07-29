//
//  TimerView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/29/22.
//

import SwiftUI

struct TimerView: View {
    let fillColor: Color
    @Binding var elapsedTime: Double
    let descriptor: String
    @Binding var timerOn: Bool
    @Binding var tapped: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(fillColor)
                .ignoresSafeArea()
            VStack {
                Text(descriptor)
                    .font(.title)
                Text("\(elapsedTime, specifier: "%.2f")")
                    .monospacedDigit()
                    .font(.largeTitle)
                    .padding()
            }
//            VStack {
            Button {
                timerOn = false
                self.tapped = false
            } label: {
                VStack {
                    Spacer()
                    Image(systemName: "x.circle")
                        .font(.title2)
                        .padding()
                }
            }.buttonStyle(.plain)

//            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    @State static var a: Double = 0.0
    @State static var b: String = "Description here"
    @State static var c: Bool = true
    @State static var d: Bool = true
    static var previews: some View {
        TimerView(fillColor: Color.cyan, elapsedTime: $a, descriptor: b, timerOn: $c, tapped: $d)
    }
}
