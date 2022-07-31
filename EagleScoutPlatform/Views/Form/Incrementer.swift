//
//  Incrementer.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/31/22.
//

import SwiftUI

struct Incrementer: View {
    @Binding var a: Int
    let spacerColor: Color = .gray
    let iconColor: Color = .black
    
    
//    init(a: Int) {
//        self.a = $a
//        foregroundColor = .black
//        spacerColor = .gray
//    }
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
                                    .frame(width: 50, height: 35, alignment: .center)
                            }
                                .disabled(a == 0)
                            Divider()
                            Button {
                                a += 1
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(iconColor)
                                    .frame(width: 50, height: 35, alignment: .center)
                            }
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 35, alignment: .center)
            }
        }
    }
}

struct Incrementer_Previews: PreviewProvider {
    @State static var a: Int = 10
    static var previews: some View {
        Incrementer(a: $a)
    }
}
