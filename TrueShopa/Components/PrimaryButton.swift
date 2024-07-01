//
//  PrimaryButton.swift
//  TrueShopa
//
//  Created by Godwin IE on 30/06/2024.
//

import SwiftUI

struct PrimaryButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
            Button {
                action()
            } label: {
                Text(title)
                .foregroundColor(.white)
                .padding(.vertical, 24)
                .padding(.horizontal, 60)
                .background(.accent)
                .cornerRadius(100)
        }
    }
}

#Preview {
    PrimaryButton(title: "Button") {}
}
