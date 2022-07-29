//
//  BackgroundSection.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/28/22.
//

import SwiftUI

struct BackgroundSection: View {
    // personal variables
    @State var roundNum: String = ""
    @State var teamNum: String = ""
    
    
    // form variables
    var reportLegality: Bool {
        (0...9999).contains(Int(teamNum) ?? 0) && (0...150).contains(Int(roundNum) ?? 0)
    }
    @Binding var reportRoundNumber: Int
    @Binding var reportTeamNumber: Int
    
    
    var body: some View {
        Section {
            GroupBox {
                HStack {
                    Spacer()
                    TextField("000", text: $roundNum)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .onChange(of: roundNum) {
                            newValue in
                            reportRoundNumber = Int(roundNum) ?? 0
                        }
//                        .focused($roundNumIsFocused)
                    Spacer()
                    Spacer()
                    TextField("#000", text: $teamNum)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .onChange(of: teamNum) { newValue in
                            reportTeamNumber = Int(teamNum) ?? 0
                        }
//                        .focused($teamNumIsFocused)
                    Spacer()
                }
                .font(.title)
            } label: {
                HStack {
                    Spacer()
                    Text("Round Number")
                    Spacer()
                    Spacer()
                    Text("Team Number")
                    Spacer()
                }
                .font(.caption)
            }
            .foregroundColor(reportLegality ? .primary : .red)
            if (!reportLegality) {
                Text("Error: Bad Input")
                    .font(.caption)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
            }

        } header: {
            Label("BACKGROUND", systemImage: "magnifyingglass")
        }
    }
}

struct BackgroundSection_Previews: PreviewProvider {
    @State static var a: Int = 0
    @State static var b: Int = 0
    
    static var previews: some View {
        BackgroundSection(reportRoundNumber: $a, reportTeamNumber: $b)
    }
}
