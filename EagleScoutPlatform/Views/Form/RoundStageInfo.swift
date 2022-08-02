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
    @FocusState var textFocused: Int?
    
    var body: some View {
    // TODO: Change this to textEditor for longer form text editing
        HStack {
            Spacer()
            ScoreStepper(score: $high, name: "High")
            Spacer()
            Divider()
            Spacer()
            ScoreStepper(score: $low, name: "Low")
            Spacer()
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
                        .padding(.leading)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            TextEditor(text: $description)
                .focused($textFocused, equals:2)
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            textFocused = nil
                        }.opacity(textFocused ?? 0 == 2 ? 1 : 0)
                    }
                }
//            }
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
