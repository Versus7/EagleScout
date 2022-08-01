//
//  Incrementer.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/31/22.
//

import SwiftUI

struct Incrementer: View {
    @Binding var a: Int
    let spacerColor: Color
    let iconColor: Color
    private let width: CGFloat = 100
    private let height: CGFloat = 35
    
    init(value: Binding<Int>) {
        self._a = value
        self.spacerColor = .gray
        self.iconColor = .black
    }
    
    init(value: Binding<Int>, iconColor: Color) {
        self._a = value
        self.iconColor = iconColor
        self.spacerColor = .gray
    }
    
    init(value: Binding<Int>, background: Color) {
        self._a = value
        self.spacerColor = background
        self.iconColor = .gray
    }
    
    init(value: Binding<Int>, iconColor: Color, background: Color) {
        self._a = value
        self.iconColor = iconColor
        self.spacerColor = background
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(spacerColor)
                    .opacity(0.3)
                    .overlay {
//                        Text("Testing")
                        HStack(alignment: .center, spacing: 0) {
                            Spacer()
                            Button {
                                if a > 0 {
                                    a -= 1
                                }
                            } label: {
                                Image(systemName: "minus")
                                    .foregroundColor(iconColor)
                                    .frame(width: width/2, height: height, alignment: .center)
                            }
                                .disabled(a == 0)
                            Divider()
                            Button {
                                a += 1
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(iconColor)
                                    .frame(width: width/2, height: height, alignment: .center)
                            }
                            Spacer()
                        }
                    }
                    .frame(width: width, height: height, alignment: .center)
            }
        }
    }
}

struct Incrementer_Previews: PreviewProvider {
    @State static var a: Int = 10
    static var previews: some View {
        Incrementer(value: $a)
    }
}
