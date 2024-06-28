//
//  WebPageIcon.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import SwiftUI

struct WebPageIcon: View {
    
    let URLString: String?
    
    var body: some View {
            if let sourceURL = URLString, let url = URL(string: sourceURL) {
                Link(destination: url) {
                    Image(systemName: "safari")
                        .resizable()
                        .foregroundColor(.cyan)
                        .fontWeight(.bold)
                }
            } else {
                Image(systemName: "safari")
                    .resizable()
                    .foregroundColor(.gray.opacity(0.8))
                    .fontWeight(.bold)
                    .disabled(true)
            }
        }
}

#Preview {
    WebPageIcon(URLString: Dev.dessertDetail.strSource)
}
