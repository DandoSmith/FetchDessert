//
//  DetailView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    let dessert: Dessert
    
    init(dessert: Dessert) {
        self.dessert = dessert
        _vm = StateObject(wrappedValue: DetailViewModel(dessert: dessert))
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack(spacing: 12) {
                    Image
                    VStack(spacing: 12) {
                        YouTube
                        Tags
                        GraySectionDivider()
                        Ingredients
                        GraySectionDivider()
                        Instructions

                    }

                }

                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    WebPageIcon(URLString: vm.dessertDetails?.strSource)
                }
            }
            .task {
                await vm.loadDessertDetails()
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(vm.dessert.mealName)
    }
}

extension DetailView {
    
    private var Image: some View {
        DessertImageView(dessert: dessert)
            .frame(maxWidth: .infinity)
            .edgesIgnoringSafeArea(.top)
    }
    
    private var Tags: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                    ForEach(vm.dessertDetails?.tagArray ?? ["Dessert"], id: \.self) { tag in
                        DessertTags(tagText: tag)
                    }
            }
            //Add the padding to the HStack within the ScrollView to avoid weird padding around the edges of the ScrollView
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
        
    }
    
    private var Instructions: some View {
        VStack{
            HStack(spacing: 0) {
                Text("Instructions ")
                    .detailViewCategoryTitleFormat()
                    .padding(.vertical, 5)
                SwiftUI.Image(systemName: "checklist.checked")
                    .font(.title3)
                Spacer()
            }
            Text("\(vm.dessertDetails?.filteredInstructions ?? "Description cannot be found.")")
                .lineSpacing(5)
        }
        .padding(.horizontal)

    }
    
    private var Ingredients: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Ingredients ")
                    .detailViewCategoryTitleFormat()
                    .padding(.vertical, 5)
                SwiftUI.Image(systemName: "cart.fill")
                    .font(.title3)
                Spacer()
            }
            
            
            ForEach(vm.dessertDetails?.ingredientMeasurements ?? [], id: \.id) { ingredient in
                HStack(spacing: 0) {
                    Text("•")
                        .fontWeight(.bold)
                        .font(.title2)
                    Text(ingredient.measurement.value.withoutSpaces() + " " + ingredient.ingredient.value.withoutSpaces())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                }
            }
        }
        .padding(.horizontal)

    }
    
    private var YouTube: some View {
   
        YouTubeButton(URLString: vm.dessertDetails?.strYoutube)
            .padding(.vertical, 8)
            .padding(.horizontal)
                
        }
    
    
}

#Preview {
    NavigationStack{
        DetailView(dessert: Dev.dessert)
    }
}
