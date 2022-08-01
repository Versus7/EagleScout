//
//  AutoSection.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/29/22.
//

import SwiftUI

struct AutoSection: View {
    @Binding var autoMovement: Bool
    @Binding var low: Int
    @Binding var high: Int
    @Binding var description: String
    var body: some View {
        Section {
            Toggle(isOn: $autoMovement, label: {
                Text("Did they move during auto?")
            })
            if (autoMovement) {
                RoundStageInfo(low: $low, high: $high, description: $description, roundType: "Auto")
            }
        } header: {
            Label("AUTO", systemImage: "desktopcomputer")
        }
    }
}

struct AutoSection_Previews: PreviewProvider {
    @State static var a: Bool = true
    @State static var b: Int = 2
    @State static var c: Int = 4
    @State static var d: String = "They were good"
    static var previews: some View {
        AutoSection(autoMovement: $a, low: $b, high: $c, description: $d)
    }
}
