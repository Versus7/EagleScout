//
//  RoundStageInfo.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/22/22.
//

import SwiftUI

struct RoundStageInfo: View {
    @Binding var low: Int
    @Binding var high: Int
    @Binding var description: String
    @State var isShowingSheet: Bool = false
    let roundType: String
    
    var body: some View {
    // TODO: Change this to textEditor for longer form text editing
        ScoreStepper(score: $low, name: "Low")
        ScoreStepper(score: $high, name: "High")
        Button("Show Full Screen Counter") {
            self.isShowingSheet = true
        }
        .sheet(isPresented: $isShowingSheet) {
            LargeIncrementer(high: $high, low: $low)
        }

        TextField(text: $description) {
            Text("\(roundType) Description")
        }
    }
}

struct ScoreStepper: View {
    @Binding var score: Int
    var name: String
    var body: some View {
        Stepper("\(name) Shots: \(score)") {
            score += 1
        } onDecrement: {
            if (score > 0) {
                score -= 1
            }
        }
    }
}

struct RoundStageInfo_Previews: PreviewProvider {
   @State static var a = 0
   @State static var b = 0
   @State static var c = "Desc"
    @State static var d = "Teleop"
    
    static var previews: some View {
        RoundStageInfo(low: $a, high: $b, description: $c, roundType: d)
    }
}
