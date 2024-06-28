//
//  FetchDessertApp.swift
//  FetchDessert
//
//  Created by Sam Smith on 6/26/24.
//

import SwiftUI

@main
struct FetchDessertApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()

    var body: some Scene {
        WindowGroup {
                HomeView()
                .environmentObject(homeViewModel)
        }
    }
}
