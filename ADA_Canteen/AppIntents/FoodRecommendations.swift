//
//  FoodRecommendations.swift
//  ADA Kantin
//
//  Created by Daven Karim on 14/05/25.
//

import SwiftUI
import AppIntents

struct FoodRecommendationView: View {
    let profile: FoodProfileEntity
    let items: [FoodItem]
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(profile.emoji) Recommendations for \(profile.name)")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            if items.isEmpty {
                ContentUnavailableView("No recommendations", systemImage: "fork.knife")
            } else {
                ForEach(items) { item in
                    HStack(spacing: 12) {
                        Image(item.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(item.location)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("Rp\(item.price)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .accentColor(Color("aksen"))
        .padding()
    }
    
}

// MARK: - Preview
struct FoodRecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProfile = FoodProfileEntity(
            id: "meatLover",
            name: "Meat Lover",
            emoji: "🍖",
            description: "aaa"
        )
        
        let sampleItems = [
            FoodItem(
                name: "Soto Daging",
                price: 20000,
                image: "soto.daging.pakGembul",
                tags: ["kategori.Sapi"],
                location: "Soto Pak Gembul",
                foodDescription: "Soto daging lezat",
                tenantId: 1
            ),
            FoodItem(
                name: "Ayam Bakar",
                price: 25000,
                image: "ayam.geprek",
                tags: ["kategori.Ayam"],
                location: "Warung Makan",
                foodDescription: "Ayam bakar spesial",
                tenantId: 2
            )
        ]
        
        return FoodRecommendationView(
            profile: sampleProfile,
            items: sampleItems
        )
        .previewDisplayName("With Items")
        
        // Preview kosong
        FoodRecommendationView(
            profile: sampleProfile,
            items: []
        )
        .previewDisplayName("Empty State")
    }
}
