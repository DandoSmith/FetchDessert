//
//  ContentView.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack() {
                    ForEach(vm.allDesserts, id: \.self) { dessert in
                        NavigationLink(value: dessert) {
                            DessertRowView(dessert: dessert)
                                .padding(.horizontal, 12)
                        }
                    }
                    .navigationTitle("Desserts 🍰")
                    .navigationDestination(for: Dessert.self) { dessert in
                        DetailView(dessert: dessert)
                    }
                    
                }
            }
        }
        .task {
            await vm.loadDesserts()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
