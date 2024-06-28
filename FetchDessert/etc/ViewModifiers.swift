//
//  ViewModifiers.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import Foundation
import SwiftUI

struct DetailViewCategoryTitle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.semibold)
            .frame(alignment: .leading)
    }
    
}

extension View {
    
    func detailViewCategoryTitleFormat() -> some View {
        modifier(DetailViewCategoryTitle())
    }
}
