//
//  YouTubeIcon.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import SwiftUI

struct YouTubeButton: View {
    
    let URLString: String?
    
    var body: some View {
            if let sourceURL = URLString, let url = URL(string: sourceURL) {
                Link(destination: url) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.red.opacity(0.95))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        HStack{
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundStyle(Color.white)
                                .frame(width: 23, height: 23)
                            Text("Open YouTube")
                                .foregroundStyle(Color.white)
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                    }
                }
            } else {
                ZStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.red.opacity(0.95))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    HStack{
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .foregroundStyle(Color.white)
                            .frame(width: 23, height: 23)
                        Text("Open YouTube")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                }
                .disabled(true)
            }
        }
}

#Preview {
    YouTubeButton(URLString: Dev.dessertDetail.strYoutube)
}
