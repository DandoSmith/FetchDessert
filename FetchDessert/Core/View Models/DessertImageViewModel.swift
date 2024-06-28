//
//  DessertImageViewModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation
import SwiftUI

class DessertImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let networkManager = DessertNetworkManager()
    private let dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
        self.isLoading = true
    }
    
    func loadDessertImage(URLString: String) async {
        guard let url = URL(string: dessert.strMealThumb)
        else { return }
        
        do {
            //Download the data from the URL
            let data = try await networkManager.downloadData(url: url)
            
            //Check if the data is valid and return an image to the image variable declared in this ViewModel
            if let image = UIImage(data: data) {
                await MainActor.run {
                    self.image = image
                }
            }
        }
        catch {
            print(error)
        }
    }
    
}
