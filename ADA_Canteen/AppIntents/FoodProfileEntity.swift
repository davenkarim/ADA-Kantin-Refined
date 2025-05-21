//
//  FoodProfileEntity.swift
//  ADA Kantin
//
//  Created by Daven Karim on 14/05/25.
//

import AppIntents
import SwiftUI

struct FoodProfileEntity: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Food Profile"
    
    let id: String
    var name: String
    var emoji: String
    var description: String
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(emoji) \(name)",
            subtitle: "\(description)"
        )
    }
    
    static var defaultQuery = FoodProfileQuery()
}

struct FoodProfileQuery: EntityQuery {
    func entities(for identifiers: [FoodProfileEntity.ID]) async throws -> [FoodProfileEntity] {
        identifiers.compactMap { id in
            allProfiles.first { $0.id == id }
        }
    }
    
    func suggestedEntities() async throws -> [FoodProfileEntity] {
        allProfiles
    }
    
    func entities(matching string: String) async throws -> [FoodProfileEntity] {
        allProfiles.filter { profile in
            profile.name.localizedCaseInsensitiveContains(string) ||
            profile.description.localizedCaseInsensitiveContains(string)
        }
    }
    
    private var allProfiles: [FoodProfileEntity] {
        [
            FoodProfileEntity(
                id: "anythingAvailable",
                name: "Anything Available",
                emoji: "🍽️",
                description: "Mengandung: Semua Kategori"
            ),
            FoodProfileEntity(
                id: "meatLover",
                name: "Meat Lover",
                emoji: "🍖",
                description: "Mengandung: Ayam, Ikan, Sapi"
            ),
            FoodProfileEntity(
                id: "vegetarian",
                name: "Vegetables Lover",
                emoji: "🥗",
                description: "Mengandung: Sayur, Kacang"
            ),
            FoodProfileEntity(
                id: "spicySeeker",
                name: "Spicy Seeker",
                emoji: "🌶️",
                description: "Mengandung: Cabe"
            ),
            FoodProfileEntity(
                id: "processedFriendly",
                name: "Processed Friendly",
                emoji: "🥫",
                description: "Mengandung: Makanan Olahan"
            ),
            FoodProfileEntity(
                id: "lightMeal",
                name: "Light Meal",
                emoji: "🥪",
                description: "Mengandung: Sayur, Ikan, Minuman"
            ),
            FoodProfileEntity(
                id: "seafoodLover",
                name: "Seafood Lover",
                emoji: "🐟",
                description: "Mengandung: Ikan, Sayur"
            ),
            FoodProfileEntity(
                id: "chickenOnly",
                name: "Chicken Only",
                emoji: "🍗",
                description: "Mengandung: Ayam"
            ),
            FoodProfileEntity(
                id: "plantBasedWithDrinks",
                name: "Plant-Based with Drinks",
                emoji: "🍵",
                description: "Mengandung: Sayur, Kacang, Minuman"
            ),
            FoodProfileEntity(
                id: "justDrink",
                name: "Just Grab a Drink",
                emoji: "🥤",
                description: "Mengandung: Minuman"
            )
        ]
    }
}
