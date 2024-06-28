//
//  DessertImageView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

struct DessertImageView: View {
    
    @StateObject var vm: DessertImageViewModel
    let dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
        _vm = StateObject(wrappedValue: DessertImageViewModel(dessert: dessert))
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
            await vm.loadDessertImage(URLString: dessert.strMealThumb)
        }
    }
}

#Preview {
    DessertImageView(dessert: Dev.dessert)
}
