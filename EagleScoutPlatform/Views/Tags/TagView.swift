//
//  TagView.swift
//  EagleScoutPlatform
//
//  Created by Vir Shah on 7/24/22.
//

import SwiftUI

struct TagView: View {
    @State var selectedValues: Set<String> = []
    let tagValues: [String]
    var body: some View {
        VStack {
            Text(String(selectedValues.description))
            ScrollView(.horizontal) {
                HStack {
                    ForEach(tagValues, id: \.self) { tagName in
                        Tag(text: tagName, listOfTags: $selectedValues)
                    }
                }
            }.padding()
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tagValues: ["OK","NOT OKAY", "BAD", "FAILING", "WINNING"])
    }
}
