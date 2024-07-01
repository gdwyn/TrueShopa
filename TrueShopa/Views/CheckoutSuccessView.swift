//
//  CheckoutSuccessView.swift
//  TrueShopa
//
//  Created by Godwin IE on 01/07/2024.
//

import SwiftUI

struct CheckoutSuccessView: View {
    @Environment (\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.accent)
                        
            Text("Checkout successful")
                .font(.title)
                .bold()
                        
            Text("Your items might be on the way 🌚")
                .font(.body)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            PrimaryButton(title: "Done") {
                dismiss()
            }
            
            
        }
        .padding(.bottom, 30)
        .padding(.top, 200)
    }
}

#Preview {
    CheckoutSuccessView()
}
