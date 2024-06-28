//
//  DessertImageView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

struct DessertDetailImageView: View {
    
    @StateObject var vm: DessertDetailImageViewModel
    let URLString: String
    
    init(URLString: String) {
        self.URLString = URLString
        _vm = StateObject(wrappedValue: DessertDetailImageViewModel(URLString: URLString))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            else if vm.isLoading {
                ProgressView()
            }
            else {
                Image(systemName: "xmark")
                    .foregroundStyle(Color.red)
            }
        }
        .task {
            await vm.loadDessertDetailImage(URLString: URLString)
        }
    }
}

//#Preview {
//    DessertImageView(dessert)
//}
