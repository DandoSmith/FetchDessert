//
//  DessertDetailModel.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import Foundation

struct DessertDetailData : Codable {
    let meals: [DessertDetail]
    
    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }

}

struct DessertDetail : Codable {
    let idMeal : String?
    let strMeal : String?
    let strDrinkAlternate : String?
    let strCategory : String?
    let strArea : String?
    let strInstructions : String
    let strMealThumb : String?
    let strTags : String?
    let strYoutube : String?
    let strIngredient1 : String?
    let strIngredient2 : String?
    let strIngredient3 : String?
    let strIngredient4 : String?
    let strIngredient5 : String?
    let strIngredient6 : String?
    let strIngredient7 : String?
    let strIngredient8 : String?
    let strIngredient9 : String?
    let strIngredient10 : String?
    let strIngredient11 : String?
    let strIngredient12 : String?
    let strIngredient13 : String?
    let strIngredient14 : String?
    let strIngredient15 : String?
    let strIngredient16 : String?
    let strIngredient17 : String?
    let strIngredient18 : String?
    let strIngredient19 : String?
    let strIngredient20 : String?
    let strMeasure1 : String?
    let strMeasure2 : String?
    let strMeasure3 : String?
    let strMeasure4 : String?
    let strMeasure5 : String?
    let strMeasure6 : String?
    let strMeasure7 : String?
    let strMeasure8 : String?
    let strMeasure9 : String?
    let strMeasure10 : String?
    let strMeasure11 : String?
    let strMeasure12 : String?
    let strMeasure13 : String?
    let strMeasure14 : String?
    let strMeasure15 : String?
    let strMeasure16 : String?
    let strMeasure17 : String?
    let strMeasure18 : String?
    let strMeasure19 : String?
    let strMeasure20 : String?
    let strSource : String?
    let strImageSource : String?
    let strCreativeCommonsConfirmed : String?
    let dateModified : String?
    
    //Takes the raw instructions string returned from the API, removes HTML formatting, and puts each sentence on a new line
    var filteredInstructions : String? {
        return strInstructions.removeHTMLTags().newLineSpacing()
    }
    
    //Filters for any null or empty values and returns an array of Measurements
    var filteredMeasurements: [Measurement] {
            let allMeasurements = [
                strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
                strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
                strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
                strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
            ]
        let bundledMeasurements = allMeasurements.compactMap { $0 }.filter { !$0.isEmpty }
        let measurements: [Measurement] = bundledMeasurements.map { Measurement(value: $0) }
        return measurements
        }
    
    //Filters for any null or empty values and returns an array of Ingredients
    var filteredIngredients: [Ingredient] {
            let allIngredients = [
                strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
                strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
                strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
                strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
            ]
            let bundledIIngredients = allIngredients.compactMap { $0 }.filter { !$0.isEmpty }
            let ingredients: [Ingredient] = bundledIIngredients.map { Ingredient(value: $0) }
            return ingredients
        }
    
    //Combines the above filtered arrays of Measurements and Ingredients to produce an Array of IngredientMeasurements
    var ingredientMeasurements: [IngredientMeasurement] {
        let measurements = filteredMeasurements
        let ingredients = filteredIngredients

        var combinedArray: [IngredientMeasurement] = []
        let count = min(measurements.count, ingredients.count)

        for i in 0..<count {
            combinedArray.append(IngredientMeasurement(ingredient: ingredients[i], measurement: measurements[i]))
        }

        return combinedArray
    }
    
    //Takes the raw tags provided by the API and separates values by comma, places them into an array, and appends to the end of the array the raw region string provided by the API
    var tagArray: [String] {
        var tagArray = strTags?.components(separatedBy: ",") ?? []
        
        if tagArray.isEmpty, let area = strArea {
            return [area]
        } else if let area = strArea {
            tagArray.append(area)
        }
        
        return tagArray
    }
    
    enum CodingKeys: String, CodingKey {
        
        case idMeal = "idMeal"
        case strMeal = "strMeal"
        case strDrinkAlternate = "strDrinkAlternate"
        case strCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strMealThumb = "strMealThumb"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strIngredient16 = "strIngredient16"
        case strIngredient17 = "strIngredient17"
        case strIngredient18 = "strIngredient18"
        case strIngredient19 = "strIngredient19"
        case strIngredient20 = "strIngredient20"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
        case strSource = "strSource"
        case strImageSource = "strImageSource"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
}

struct Measurement: Identifiable, Hashable {
    let id = UUID()
    let value: String
}

struct Ingredient: Identifiable, Hashable {
    let id = UUID()
    let value: String
}

struct IngredientMeasurement: Identifiable, Hashable {
    
    let id = UUID()
    let ingredient: Ingredient
    let measurement: Measurement
}
