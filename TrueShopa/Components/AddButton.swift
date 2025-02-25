//
//  AddButton.swift
//  TrueShopa
//
//  Created by Godwin IE on 01/07/2024.
//

import SwiftUI

struct AddButton: View {
    
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding(16)
                .background(.accent)
                .clipShape(Circle())
        }
    }
}

#Preview {
    AddButton(icon: "plus") {}
}
