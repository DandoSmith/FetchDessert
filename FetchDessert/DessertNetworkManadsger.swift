////
////  DessertDataService.swift
////  FetchDessert
////
////  Created by Sam Smith on 6/26/24.
////
//
//import Foundation
//
//class DessertDataService {
//    
//    private init() {}
//    
//    func getDessertData(urlString: String) async throws -> DessertData {
//        guard let url = URL(string: urlString) else {
//            throw URLError(.badURL)
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        
//        return data
//    }
//    
//    func getDessertDetailData(urlString: String, id: String) async throws -> Data {
//        guard let url = URL(string: urlString) else {
//            throw URLError(.badURL)
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
//        
//        return data
//    }
//}
