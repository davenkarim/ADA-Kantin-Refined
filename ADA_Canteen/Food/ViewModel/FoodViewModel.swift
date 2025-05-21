//
//  FoodViewModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

class FoodViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var filterModel = FoodFilterModel()
    
    let foodItems: [FoodItem]
    
    init() {
        self.foodItems = DataHelper.shared.allTenants.flatMap(\.foodItems)
    }
    
    var filteredFoodItems: [FoodItem] {
        foodItems.filter { food in
            let priceFilter = Double(food.price) <= filterModel.maxPrice
            
            let categoryFilter = filterModel.selectedCategories.isEmpty ||
            food.tags.contains { filterModel.selectedCategories.contains($0) }
            
            let searchFilter = searchText.isEmpty ||
            food.name.localizedCaseInsensitiveContains(searchText)
            
            return priceFilter && categoryFilter && searchFilter
        }
    }
    
    func generateFilterText() -> String {
        var parts = [String]()
        
        if !filterModel.selectedCategories.isEmpty {
            let categoryNames = filterModel.selectedCategories.map { $0.replacingOccurrences(of: "kategori.", with: "") }
            let categoriesText = categoryNames.count == 1 ?
            "kategori \(categoryNames[0])" :
            "kategori \(categoryNames.joined(separator: ", "))"
            parts.append(categoriesText)
        }
        
        if filterModel.maxPrice < 50000 {
            parts.append("harga < Rp\(Int(filterModel.maxPrice).formattedWithSeparator)")
        }
        
        if parts.isEmpty {
            return "Menampilkan semua makanan"
        } else {
            return "Menampilkan makanan dengan \(parts.joined(separator: " dan "))"
        }
    }
}
