//
//  BackgroundSection.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/28/22.
//

import SwiftUI

struct BackgroundSection: View {
    // personal variables
    // TODO: Clear these variables when form has been submit.
    @State var roundNum: String = ""
    @State var teamNum: String = ""
//    @FocusState private var roundFocused: Bool
//    @FocusState private var teamNumFocused: Bool
    @FocusState private var fieldFocused: Int?
    
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
                        .focused($fieldFocused, equals:0)
                        .multilineTextAlignment(.center)
                        .onChange(of: roundNum) {
                            newValue in
                            reportRoundNumber = Int(roundNum) ?? 0
                        }
                    Spacer()
                    Spacer()
                    TextField("#000", text: $teamNum)
                        .keyboardType(.numberPad)
                        .focused($fieldFocused, equals:1)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
//                    ToolbarItem(placement: .keyboard) {
                        Button {
////                            if teamNumFocused {
////                                roundFocused = true
////                                teamNumFocused = false
//                            }
                            fieldFocused! -= 1
                        } label: {
                            Image(systemName: "chevron.left")
                        }.disabled(fieldFocused == 0)
                        .opacity(fieldFocused ?? 3 < 2 ? 1: 0)
////                    }
////                    ToolbarItem(placement: .keyboard) {
                        Button {
////                                if roundFocused {
////                                roundFocused = false
////                                teamNumFocused = true
////                                }
                            fieldFocused! += 1
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                        .disabled(fieldFocused == 1)
                        .opacity(fieldFocused ?? 3 < 2 ? 1: 0)
                    Spacer()
//                    ToolbarItem(placement: .keyboard) {
                        Button {
                            fieldFocused = nil
                        } label: {
                            Text("Done")
                        }.opacity(fieldFocused ?? 3 < 2 ? 1: 0)
//                    }
                }
            }
//            }
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
