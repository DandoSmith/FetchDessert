//
//  NetworkManager.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import Foundation

class DessertNetworkManager {
        
    func downloadData(url: URL) async throws -> Data {
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            return data
        }
        catch {
            throw error
        }
    }
}
