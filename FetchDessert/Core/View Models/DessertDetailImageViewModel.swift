//
//  DessertImageViewModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation
import SwiftUI

class DessertDetailImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let networkManager = DessertNetworkManager()
    private let URLString: String
    
    init(URLString: String) {
        self.URLString = URLString
        self.isLoading = true
    }
    
    func loadDessertDetailImage(URLString: String) async {
        print(URLString)
        guard let url = URL(string: URLString)
        else { return }
        
        do {
            //download the data from the URL
            let data = try await networkManager.downloadData(url: url)
            
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
