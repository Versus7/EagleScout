//
//  Tag.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/24/22.
//

import SwiftUI

struct Tag: View {
    let text: String
    @State var isPressed: Bool = false
    @Binding var listOfTags: Set<String>
    var body: some View {
        Button {
            isPressed.toggle()
            if isPressed {
                listOfTags.insert(text)
            } else {
                listOfTags.remove(text)
            }
        } label: {
            Text(self.text)
                .font(.system(.body, design: .rounded))
        }.buttonStyle(.borderedProminent)
            .cornerRadius(25)
            .tint(self.isPressed ? .custom1 : .gray)

    }
}

struct Tag_Previews: PreviewProvider {
    @State static var a: Set<String> = []
    static var previews: some View {
        Tag(text: "Ok then.", listOfTags: $a)
    }
}
