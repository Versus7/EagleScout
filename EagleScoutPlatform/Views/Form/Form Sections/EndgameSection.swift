//
//  EndgameSection.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/29/22.
//

import SwiftUI

struct EndgameSection: View {
    @Binding var attemptedClimb: Bool
    @Binding var climbHeight: ClimbLevel
    @Binding var climbTime: Double
    
    var body: some View {
        Section {
            Toggle(isOn: $attemptedClimb) {
                Text("Attempted climb?")
            }
            
            if (attemptedClimb) {
                Menu {
                    Button("Traversal") {
                        climbHeight = .traversal
                    }
                    
                    Button("High") {
                        climbHeight = .high
                    }
                    
                    Button("Mid") {
                        climbHeight = .mid
                    }
                    
                    Button("Low") {
                       climbHeight = .low
                    }
                } label: {
                    Text("Robot Climb: \(climbHeight.rawValue)")
                }
                
                Slider(value: $climbTime, in: 0...195)
                Text("Time to climb: \(climbTime, specifier: "%.2f") seconds")
            }
        } header: {
            Label("ENDGAME", systemImage: "forward.fill")
            }
    }
}

struct EndgameSection_Previews: PreviewProvider {
    @State static var a: Bool = true
    @State static var b: ClimbLevel = .traversal
    @State static var c: Double = 0
    static var previews: some View {
        EndgameSection(attemptedClimb: $a, climbHeight: $b, climbTime: $c)
    }
}
