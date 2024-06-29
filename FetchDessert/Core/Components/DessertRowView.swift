//
//  DessertRowView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

struct DessertRowView: View {
    
    let dessert : Dessert
    
    var body: some View {
        VStack(spacing: 15) {
            Divider()
            HStack( spacing: 20) {
                DessertImageView(dessert: dessert)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                Text(dessert.mealName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundStyle(.primaryText)
                    .multilineTextAlignment(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding()
                    .foregroundStyle(.primaryText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DessertRowView(dessert: Dev.dessert)
}
