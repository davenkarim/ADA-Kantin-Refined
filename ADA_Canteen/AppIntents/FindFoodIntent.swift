//
//  FindFoodIntent.swift
//  ADA Kantin
//
//  Created by Daven Karim on 14/05/25.
//

import AppIntents

enum IntentError: Swift.Error, CustomLocalizedStringResourceConvertible {
    case foodDataUnavailable
    case noRecommendations
    
    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .foodDataUnavailable:
            return "Food data not available"
        case .noRecommendations:
            return "No recommendations found"
        }
    }
}

struct FindFoodIntent: AppIntent {
    static var title: LocalizedStringResource = "Find Food in ADA Kantin"
    static var openAppWhenRun: Bool = false
    
    @Parameter(title: "Food Profiles")
    var profile: FoodProfileEntity
    
    static var parameterSummary: some ParameterSummary {
        Summary("Find food for \(\.$profile) profile in ADA Kantin")
    }
    
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        let allItems = DataHelper.shared.allFoodItems
        guard !allItems.isEmpty else {
            throw IntentError.foodDataUnavailable
        }
        
        let recommendations = getRecommendations(for: profile.id).shuffled()
        guard !recommendations.isEmpty else {
            throw IntentError.noRecommendations
        }
        
        let top5 = Array(recommendations.prefix(5))
        let names = top5.map { $0.name }.joined(separator: ", ")
        
        return .result(
            dialog: IntentDialog("Here are your today's picks for \(profile.name): \(names)."),
            view: FoodRecommendationView(profile: profile, items: top5)
        )
    }
    
    private func getRecommendations(for profileId: String) -> [FoodItem] {
        let categories = FoodCategory.categories(for: profileId)
        let categoryTags = categories.map { $0.rawValue }
        
        return DataHelper.shared.allFoodItems.filter { item in
            categoryTags.contains { tag in
                item.tags.contains(tag)
            }
        }
    }
    
}
