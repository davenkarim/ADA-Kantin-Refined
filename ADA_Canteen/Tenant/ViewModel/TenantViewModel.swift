//
//  TenantViewModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

class TenantViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var filterModel = TenantFilterModel()
    
    private let allTenants: [TenantItem]
    
    init() {
        self.allTenants = DataHelper.shared.allTenants
    }
    
    var filteredTenants: [TenantItem] {
        allTenants.filter { tenant in
            // Search filter
            let searchFilter = searchText.isEmpty ||
            tenant.name.localizedCaseInsensitiveContains(searchText)
            
            // Category filter
            let categoryFilter = filterModel.selectedCategories.isEmpty ||
            tenant.tags.contains { filterModel.selectedCategories.contains($0) }
            
            // Price range filter
            let priceFilter = priceRangeMatches(tenant: tenant)
            
            return searchFilter && categoryFilter && priceFilter
        }
    }
    
    private func priceRangeMatches(tenant: TenantItem) -> Bool {
        let tenantMin = tenant.minPrice
        let tenantMax = tenant.maxPrice
        let filterMin = filterModel.minPrice ?? Int.min
        let filterMax = filterModel.maxPrice ?? Int.max
        
        return (tenantMax >= filterMin) && (tenantMin <= filterMax)
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
        
        if let min = filterModel.minPrice, let max = filterModel.maxPrice {
            parts.append("harga Rp\(min.formattedWithSeparator)-Rp\(max.formattedWithSeparator)")
        } else if let min = filterModel.minPrice {
            parts.append("harga > Rp\(min.formattedWithSeparator)")
        } else if let max = filterModel.maxPrice {
            parts.append("harga < Rp\(max.formattedWithSeparator)")
        }
        
        return parts.isEmpty ? "Menampilkan semua tenant" :
            "Menampilkan tenant dengan \(parts.joined(separator: " dan "))"
    }
}
