//
//  CheckoutViewModel.swift
//  TrueShopa
//
//  Created by Godwin IE on 01/07/2024.
//

import SwiftUI
//import Combine

class CheckoutViewModel: ObservableObject {
    @Published var checkoutItems: [ShopItem] = []
    
    var totalPrice: Double {
        checkoutItems.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }
    
    func addItem(_ item: ShopItem) {
        //check if item is already on our list
        if let index = checkoutItems.firstIndex(where: { $0.id == item.id
        }) {
            //increase qty if we have item
            checkoutItems[index].quantity += 1
        } else {
            //else add item
            var newItem = item
            newItem.quantity = 1
            checkoutItems.append(newItem)
        }
    }

    func removeItem(_ item: ShopItem) {
            if let index = checkoutItems.firstIndex(where: { $0.id == item.id }) {
                checkoutItems.remove(at: index)
            }
        }
}
