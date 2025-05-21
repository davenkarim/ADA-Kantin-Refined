//
//  FoodModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let image: String
    let tags: [String]
    let location: String
    let foodDescription: String
    let tenantId: Int
}
