//
//  DetailViewModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation
import Combine
import SwiftUI

class DetailViewModel: ObservableObject {
    
    @Published var dessertDetails: DessertDetail?

    let dessert: Dessert
    
    private let networkManager = DessertNetworkManager()
        
        init(dessert: Dessert) {
            self.dessert = dessert
        }
    
    func loadDessertDetails() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessert.idMeal)")
        else { return }
        
        do {
            //Download the data from the URL
            let data = try await networkManager.downloadData(url: url)
            
            //Convert JSON data into usable DessertDetailsData Model
            let dessertDetailData = try JSONDecoder().decode(DessertDetailData.self, from: data)
                await MainActor.run {
                    //Get the first result (there is only 1 result) from the returned DessertDetailData and put it into the dessertDetail variable declared in this ViewModel
                    dessertDetails = dessertDetailData.meals.first ?? Dev.errorDessertDetail

                }
        }
        catch {
            print(error)
        }
        
    }
}
