//
//  FoodCategory.swift
//  ADA Kantin
//
//  Created by Daven Karim on 15/05/25.
//

import Foundation

enum FoodCategory: String, CaseIterable {
    case sapi = "kategori.Daging"
    case ayam = "kategori.Ayam"
    case sayur = "kategori.Sayur"
    case pedas = "kategori.Cabe"
    case ikan = "kategori.Ikan"
    case kacang = "kategori.Kacang"
    case minuman = "kategori.Minuman"
    case processed = "kategori.Processed"
    
    var displayName: String {
        switch self {
        case .sapi: return "Sapi"
        case .ayam: return "Ayam"
        case .sayur: return "Sayur"
        case .pedas: return "Pedas"
        case .ikan: return "Ikan"
        case .kacang: return "Kacang"
        case .minuman: return "Minuman"
        case .processed: return "Processed"
        }
    }
    
    static func tag(for category: FoodCategory) -> String {
        return category.rawValue
    }
    
    static func categories(for profileId: String) -> [FoodCategory] {
        switch profileId {
        case "anythingAvailable": return allCases
        case "meatLover": return [.sapi, .ayam, .ikan]
        case "vegetarian": return [.sayur, .kacang]
        case "spicySeeker": return [.pedas]
        case "processedFriendly": return [.processed]
        case "lightMeal": return [.sayur, .ikan, .minuman]
        case "seafoodLover": return [.ikan, .sayur]
        case "chickenOnly": return [.ayam]
        case "plantBasedWithDrinks": return [.sayur, .kacang, .minuman]
        case "justDrink": return [.minuman]
        default: return []
        }
    }
}
