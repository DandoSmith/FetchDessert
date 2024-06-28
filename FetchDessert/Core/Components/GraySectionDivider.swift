//
//  GraySectionDivider.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/28/24.
//

import SwiftUI

struct GraySectionDivider: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(Color.gray.opacity(0.2))
            .frame(maxWidth: .infinity)
            .frame(height: 12)
            .blur(radius: 0.5)
    }
}

#Preview {
    GraySectionDivider()
}
