//
//  TenantDetailViewModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

class TenantDetailViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var filterModel = FoodFilterModel()
    
    let tenant: TenantItem
    
    init(tenant: TenantItem) {
        self.tenant = tenant
    }
    
    var filteredFoodItems: [FoodItem] {
        tenant.foodItems.filter { food in
            let priceFilter = Double(food.price) <= filterModel.maxPrice
            let categoryFilter = filterModel.selectedCategories.isEmpty ||
                food.tags.contains { filterModel.selectedCategories.contains($0) }
            let searchFilter = searchText.isEmpty ||
                food.name.localizedCaseInsensitiveContains(searchText)
            
            return priceFilter && categoryFilter && searchFilter
        }
    }
}
