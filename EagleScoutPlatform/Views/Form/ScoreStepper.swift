//
//  ScoreStepper.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/31/22.
//

import SwiftUI

struct ScoreStepper: View {
    @Binding var score: Int
    var name: String
    var body: some View {
        GroupBox {
            Text(name.uppercased())
                .font(.caption)
                .foregroundColor(.gray)
            Text("\(score)")
                .font(.title2)
            Incrementer(value: $score)
        }
        .scaledToFill()
    }
}

struct ScoreStepper_Previews: PreviewProvider {
    @State static var a: Int = 0
    static var previews: some View {
        ScoreStepper(score: $a, name: "Low")
    }
}
