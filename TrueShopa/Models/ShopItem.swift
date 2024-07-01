//
//  ProductItem.swift
//  TrueShopa
//
//  Created by Godwin IE on 01/07/2024.
//

import Foundation

struct ShopItem: Identifiable {
    var id = UUID()
    let title: String
    let image: String
    let price: Double
    var quantity: Int
}

