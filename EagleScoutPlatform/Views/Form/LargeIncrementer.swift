//
//  LargeIncrementer.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/23/22.
//

import SwiftUI

struct LargeIncrementer: View {
    @Binding var high: Int
    @Binding var low: Int
    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack(alignment: .center, spacing: 2) {
                    GroupBox {
                        VStack {
                            HStack {
                                Spacer()
                                Text("High")
                                    .font(.headline)
                                Spacer()
                                Text(String(high)).monospacedDigit()
                                    .font(.largeTitle)
                                Spacer()
                            }.padding(.horizontal)
                            HStack {
                                Spacer()
                                Text("Low")
                                    .font(.headline)
                                Spacer()
                                Text(String(low)).monospacedDigit()
                                    .font(.largeTitle)
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    } label: {
                        Text("Score")
                    }
                    .padding()
                    Spacer()
                    Incrementer(value: $high, iconColor: .primary, width: reader.size.width*0.85, height: reader.size.width*0.3, imageSize: .title)
                    Incrementer(value: $low, iconColor: .primary, width: reader.size.width*0.85, height: reader.size.width*0.3, imageSize: .title)
                        .padding(.bottom)
                }
            }
        }
    }
}

struct LargeIncrementer_Previews: PreviewProvider {
    @State static var a = 7
    @State static var b = 0
    static var previews: some View {
        LargeIncrementer(high: $a, low: $b)
            .preferredColorScheme(.light)
        LargeIncrementer(high: $a, low: $b)
            .preferredColorScheme(.dark)
    }
}
