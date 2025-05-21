//
//  TenantFilterModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation
import Observation

@Observable
class TenantFilterModel {
    var selectedCategories: Set<String> = []
    var minPrice: Int?
    var maxPrice: Int?
    
    func toggleCategory(_ category: String) {
        selectedCategories.toggle(category)
    }
    
    func reset() {
        selectedCategories = []
        minPrice = nil
        maxPrice = nil
    }
    
    var priceRangeText: String {
        var parts = [String]()
        
        if let min = minPrice {
            parts.append("> Rp\(min.formattedWithSeparator)")
        }
        
        if let max = maxPrice {
            parts.append("< Rp\(max.formattedWithSeparator)")
        }
        
        return parts.joined(separator: " dan ")
    }
}
