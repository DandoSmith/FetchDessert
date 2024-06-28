//
//  String.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/27/24.
//

import Foundation

extension String {
    
    //Removes HTML tags from a String
    func removeHTMLTags() -> String {
        let withoutTags1 = self.replacingOccurrences(of: "<[^>]+<", with: "", options: .regularExpression, range: nil)
        let withoutTags2 = withoutTags1.replacingOccurrences(of: "\r\n\r\n", with: " ")
        let withoutTags3 = withoutTags2.replacingOccurrences(of: "\r\n", with: " ")
        let withoutTags4 = withoutTags3.replacingOccurrences(of: "Optional(", with: "")
        let withoutTags5 = withoutTags4.replacingOccurrences(of: ")", with: "")
        return withoutTags5
    }
    
    //Removes spaces at the beginning and end of a String
    func withoutSpaces() -> String {
            guard let startIndex = self.firstIndex(where: { !$0.isWhitespace }) else {
                return ""
            }
            guard let endIndex = self.lastIndex(where: { !$0.isWhitespace }) else {
                return ""
            }
            return String(self[startIndex...endIndex])
        }
    
    //Capitalizes the first letter each word within a string
    func capitalizedFirstLetters() -> String {
            return self
                .components(separatedBy: " ")
                .map { $0.capitalized }
                .joined(separator: " ")
        }
    
    //Creates a new line after a period within a string
    func newLineSpacing() -> String {
        return self.replacingOccurrences(of: ". ", with: ".\n")
    }

}
