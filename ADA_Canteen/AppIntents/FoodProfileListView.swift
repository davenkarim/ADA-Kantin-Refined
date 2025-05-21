//
//  FoodProfileListView.swift
//  ADA Kantin
//
//  Created by Daven Karim on 15/05/25.
//

import SwiftUI
import AppIntents

struct FoodProfileListView: View {
    let profiles: [FoodProfileEntity]
    var onSelect: (FoodProfileEntity) -> Void
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("What are you in the mood for?")
                    .font(.headline)
                    .padding(.top, 16)
                
                ForEach(profiles) { profile in
                    ProfileRow(profile: profile)
                        .onTapGesture {
                            onSelect(profile)
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}

struct ProfileRow: View {
    let profile: FoodProfileEntity
    
    var body: some View {
        HStack(spacing: 12) {
            Text(profile.emoji)
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .background(Color.white)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(profile.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(profile.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

// MARK: - Preview
struct FoodProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleProfiles = [
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
            )
        ]
        
        Group {
            // Light Mode
            FoodProfileListView(profiles: sampleProfiles) { _ in }
                .previewDisplayName("Light Mode")
            
            // Dark Mode
            FoodProfileListView(profiles: sampleProfiles) { _ in }
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
            
            // Single Row Preview
            ProfileRow(profile: sampleProfiles[0])
                .previewDisplayName("Single Row")
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}
