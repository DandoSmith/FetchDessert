//
//  HomeViewModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allDesserts: [Dessert] = []
    private let networkManager = DessertNetworkManager()
    
    func loadDesserts() async {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        else { return }
        
        do {
            //Download the data from the URL
            let data = try await networkManager.downloadData(url: url)
            
            //Convert JSON data into usable DessertData Model
            let dessertData = try JSONDecoder().decode(DessertData.self, from: data)
                await MainActor.run {
                    if allDesserts.isEmpty {
                        //Append the array of Dessert models within DessertData into allDesserts declared within this ViewModel
                        allDesserts += dessertData.meals
                    }

                }
        }
        catch {
            print(error)
        }
        
    }
    
}
