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
                Rectangle()
                    .opacity(0)
                HStack(alignment: .center, spacing: 2) {
                    Button {
                        if high > 0 {
                            high -= 1
                        }
                    } label: {
                        Rectangle()
                            .opacity(0)
                            .border(.red, width: 4)
                            .overlay(Image(systemName: "minus").imageScale(.large))
                            .foregroundColor(.red)
                    }
                    Button {
                        high += 1
                    } label: {
                        Rectangle()
                            .opacity(0)
                            .border(.green, width: 4)
                            .overlay(Image(systemName: "plus").imageScale(.large))
                            .foregroundColor(.green)
                    }
                }
                HStack(alignment: .center, spacing: 2) {
                    Button {
                        if low > 0 {
                            low -= 1
                        }
                    } label: {
                        Rectangle()
//                            .foregroundColor(.accentColor)
                            .opacity(0)
                            .border(.red, width: 4)
                            .overlay(Image(systemName: "minus").imageScale(.large))
                            .foregroundColor(.red)
                    }
                    Button {
                        low += 1
                    } label: {
                        Rectangle()
//                            .foregroundColor(.green)
                            .opacity(0)
                            .border(.green, width: 4)
                            .overlay(Image(systemName: "plus").imageScale(.large))
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}

struct LargeIncrementer_Previews: PreviewProvider {
    @State static var a = 0
    @State static var b = 0
    static var previews: some View {
        LargeIncrementer(high: $a, low: $b)
            .preferredColorScheme(.dark)
    }
}
