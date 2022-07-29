//
//  TimerOption.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/29/22.
//

import SwiftUI

struct TimerOption: View {
    let imageName: String
    let caption: String
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .opacity(0.5)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100, alignment: .center)
                Image(systemName: imageName)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            Text(caption)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct TimerOption_Previews: PreviewProvider {
    static var previews: some View {
        TimerOption(imageName: "exclamationmark.triangle.fill", caption: "Time Dead")
    }
}
