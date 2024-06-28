//
//  DessertDataService.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation
import Combine

class DessertDetailDataService {
    
    @Published var dessertDetails: DessertDetail? = nil
    
    var dessertDetailSubscription: AnyCancellable?
    let dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
        getDesserts()
    }
    
    private func getDesserts() {
        
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(dessert.idMeal)")
        else { return }
        
        dessertDetailSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: DessertDetailData.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedDessertDetails) in
                self?.dessertDetails = returnedDessertDetails.meals.first
                print(returnedDessertDetails)
                self?.dessertDetailSubscription?.cancel()
            }
    }
}
