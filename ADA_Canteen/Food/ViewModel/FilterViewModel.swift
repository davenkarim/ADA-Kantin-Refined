//
//  FilterViewModel.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import Foundation

class FoodFilterViewModel: ObservableObject {
    @Published var filterModel: FoodFilterModel
    @Published var maxPriceText: String
    
    let categories = ["kategori.Ayam", "kategori.Sayur", "kategori.Ikan", "kategori.Sapi", "kategori.Cabe", "kategori.Minuman", "kategori.Processed", "kategori.Kacang"]
    
    init(filterModel: FoodFilterModel) {
        self.filterModel = filterModel
        self.maxPriceText = filterModel.maxPrice < 50000 ? "\(Int(filterModel.maxPrice))" : ""
    }
    
    func updateMaxPrice() {
        let filtered = maxPriceText.filter { $0.isNumber }
        if !filtered.isEmpty, let price = Int(filtered) {
            filterModel.maxPrice = Double(price)
        } else {
            filterModel.maxPrice = 50000
        }
    }
    
    func resetFilters() {
        filterModel.reset()
        maxPriceText = ""
    }
}
