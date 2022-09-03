//
//  OnboardingView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 9/2/22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var welcome: Bool
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: .center, spacing: 0) {
                Text("Welcome to EagleScout")
                        .font(.title)
                        .foregroundColor(Color.custom1)
                        .bold()
                        .padding()
                Group {
                    Spacer()
                    FeatureRow(imageName: "wifi.slash", title: "Offline First. Always.", description: "You never need a wifi connection to make and save scouting reports.", maxWidth: reader.size.width*0.6)
                    Spacer()
                    FeatureRow(imageName: "slider.horizontal.3", title: "UI that makes sense", description: "Our intuitive UI is so good, you won't even need to look down when tallying a robot's score.", maxWidth: reader.size.width*0.6)

                    Spacer()
                    FeatureRow(imageName: "person.circle", title: "Robot Profiles", description: "Everything you need to know about a robot, in one place. What's not to love?", maxWidth: reader.size.width*0.6)

                    Spacer()
                    FeatureRow(imageName: "list.number", title: "Upcoming Matches", description: "Never miss a scouting match again with our list of upcoming matches you need to scout.", maxWidth: reader.size.width*0.6)
                }
                Spacer()
                Button {
                    welcome = false
                } label: {
                    Text("Ready?")
                        .font(.title2)
                        .padding()
                        .frame(minWidth: reader.size.width*0.8)
                }.buttonBorderShape(.capsule)
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(welcome: .constant(true))
    }
}
