//
//  DessertTags.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import SwiftUI

struct DessertTags: View {
    
    let tagText: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(Color.theme.secondaryTextColor)
            .frame(width: 120, height: 40)
            .overlay(
                Text("#" + tagText)
                    .font(.subheadline)
            )
    }
}

#Preview {
    DessertTags(tagText: "Test")
}
