//
//  FilterModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation
import Observation

@Observable
class FoodFilterModel {
    var maxPrice: Double = 50000
    var selectedCategories: Set<String> = []
    
    var formattedMaxPrice: String {
        if maxPrice < 50000 {
            return "Rp\(Int(maxPrice).formattedWithSeparator)"
        }
        return "Semua"
    }
    
    func toggleCategory(_ category: String) {
        selectedCategories.toggle(category)
    }
    
    func reset() {
        maxPrice = 50000
        selectedCategories = []
    }
}
