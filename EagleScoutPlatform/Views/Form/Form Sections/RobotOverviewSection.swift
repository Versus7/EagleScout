//
//  RobotOverviewSection.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/29/22.
//

import SwiftUI

struct RobotOverviewSection: View {
    @Binding var speed: SpeedResult
    @Binding var driverSkill: Double
    var body: some View {
        Section {
            Text("Speed (compared to our robot)")
                .font(.caption)
                .frame(maxWidth: .infinity)
            Picker("", selection: $speed) {
                Text("Slower").tag(SpeedResult.slower)
                Text("Equal").tag(SpeedResult.equal)
                Text("Faster").tag(SpeedResult.faster)
            }
            .pickerStyle(.segmented)
            Text("Driver skill: \(Int(driverSkill))")
                .font(.caption)
                .frame(maxWidth: .infinity)
            Slider(value: $driverSkill, in: 0...5, step: 1)
            
        } header: {
            Label("OVERVIEW", systemImage: "book.closed.fill")
        }    }
}

struct RobotOverviewSection_Previews: PreviewProvider {
    @State static var a: SpeedResult = .faster
    @State static var b: Double = 10
    static var previews: some View {
        RobotOverviewSection(speed: $a, driverSkill: $b)
    }
}
