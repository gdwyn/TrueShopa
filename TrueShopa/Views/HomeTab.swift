//
//  TabView.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct HomeTab: View {
    
    @StateObject private var viewModel = CheckoutViewModel()

    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "circle.grid.2x2")
                    Text("Home")
                }
            
            CheckoutView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "bag")
                    Text("Checkout")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    HomeTab()
}
