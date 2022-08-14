//
//  FeatureRow.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 8/13/22.
//

import SwiftUI

struct FeatureRow: View {
    let imageName: String
    let title: String
    let description: String
    let maxWidth: CGFloat
    var body: some View {
//        GeometryReader { reader in
            HStack {
                Spacer()
                Image(systemName: self.imageName)
                    .font(.largeTitle)
                    .foregroundColor(Color.custom1)
                Spacer()
                VStack(alignment: .leading) {
                    Text("\(title)")
                        .font(.title2)
                        .bold()
                    Text(description)
                        .multilineTextAlignment(.leading)
                }//.frame(maxWidth: reader.size.width * 0.6)
                .frame(maxWidth: self.maxWidth)
                Spacer()
            }
//        }
    }
}

struct FeatureRow_Previews: PreviewProvider {
    static var previews: some View {
        FeatureRow(imageName: "person.circle", title: "Robot Profile", description: "Everything you need to know about a robot. In one place.", maxWidth: 100)
    }
}
