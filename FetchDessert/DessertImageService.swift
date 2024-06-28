//
//  DessertImageDataService.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation
import SwiftUI
import Combine

class DessertImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
        getDessertImage()
    }
    
    private func getDessertImage() {
        guard let url = URL(string: dessert.strMealThumb)
        else { return }
        
        imageSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            }
    }
}
