//
//  OnboardingView.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var isOnboarding: Bool

    var body: some View {
        ZStack{
            Image("bg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo-w")

                Text("Shop your favorites, all in one place")
                    .padding(.horizontal, 24)
                .multilineTextAlignment(.center)
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                PrimaryButton(title: "Start shoping") {
                    withAnimation {
                        isOnboarding = false
                    }
                }
                .padding(.bottom, 68)
                .padding(.top, 10)
            }
        }
        .transition(.scale)

    }
}

#Preview {
    OnboardingView(isOnboarding: .constant(true))
}
