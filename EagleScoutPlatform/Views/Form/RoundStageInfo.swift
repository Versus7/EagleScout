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
        HStack {
            ScoreStepper(score: $high, name: "High")
            ScoreStepper(score: $low, name: "Low")
        }.frame(maxWidth: .infinity)
        Button() {
            self.isShowingSheet = true
        } label: {
            Label("Show Counter", systemImage: "plus.forwardslash.minus")
        }
        .buttonStyle(.bordered)
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $isShowingSheet) {
            LargeIncrementer(high: $high, low: $low)
        }

        ZStack {
            if description == "" {
                HStack {
                    Text("Describe their \(roundType.lowercased()) here")
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            TextEditor(text: $description)
        }
    }
}


struct RoundStageInfo_Previews: PreviewProvider {
   @State static var a = 0
   @State static var b = 0
   @State static var c = ""
    @State static var d = "Teleop"
    
    static var previews: some View {
        RoundStageInfo(low: $a, high: $b, description: $c, roundType: d)
    }
}
