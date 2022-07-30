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
//        Capsule()
//            .fill(Color.red)
//            .opacity(0.5)
//            .background(Text("HELLO"))
//            .frame(width: 200, height: 100, alignment: .center)
//            .cornerRadius(10)
        Button {
            isPressed.toggle()
            if isPressed {
                listOfTags.insert(text)
            } else {
                listOfTags.remove(text)
            }
        } label: {
//            Label(text, systemImage: isPressed ? "checkmark" : "")
            Text(self.text)
//                .padding()
//                .fill(Color.red)
//            Capsule()
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
