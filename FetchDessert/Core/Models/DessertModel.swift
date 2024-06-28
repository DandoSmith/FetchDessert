//
//  DessertModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation


struct DessertData : Codable {
    let meals: [Dessert]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Dessert: Identifiable, Codable, Hashable {
    
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    //Uses the Meal ID to conform to Identifiable protocol
    var id: String { idMeal }
    
    //Capitalizes the first letter of each word of the raw meal names string returned from the API.
    var mealName: String {
        let updatedMealName = strMeal.capitalizedFirstLetters()
        return updatedMealName
    }
    
    
    enum CodingKeys: String, CodingKey {
        case strMeal, strMealThumb, idMeal
    }
}
