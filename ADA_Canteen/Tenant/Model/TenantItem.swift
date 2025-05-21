//
//  TenantItem.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation

struct TenantItem: Identifiable {
    let id: Int
    let name: String
    let image: String
    let logo: String
    let minPrice: Int
    let maxPrice: Int
    let tags: [String]
    let description: String
    let foodItems: [FoodItem]
    
    var priceRangeString: String {
        "\(minPrice.formattedWithSeparator) - \(maxPrice.formattedWithSeparator)"
    }
}
