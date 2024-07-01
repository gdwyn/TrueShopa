//
//  ContentView.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOnboarding = true

    var body: some View {
        if isOnboarding {
            OnboardingView(isOnboarding: $isOnboarding)
        } else {
            HomeTab()
        }
    }
}

#Preview {
    ContentView()
}
