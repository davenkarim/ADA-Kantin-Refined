//
//  FoodDetailView.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct FoodDetailView: View {
    let foodItem: FoodItem
    
    var tenant: TenantItem? {
        DataHelper.shared.allTenants.first(where: { $0.id == foodItem.tenantId })
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                foodImage
                foodDetails
            }
        }
    }
    
    private var foodImage: some View {
        Image(foodItem.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 250)
            .frame(width: 370)
            .cornerRadius(8)
            .clipped()
            .padding(.bottom, 20)
    }
    
    private var foodDetails: some View {
        VStack(spacing: 16) {
            VStack(spacing: 4) {
                HStack {
                    Text(foodItem.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 18)
                        .font(.system(size: 24))
                    
                    Text("\(foodItem.price)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 18)
                        .font(.system(size: 24))
                        .foregroundColor(Color(.black))
                }
                
                HStack(alignment: .center, spacing: 8) {
                    ForEach(foodItem.tags, id: \.self) { tag in
                        Image(tag)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 5)
                .padding(.bottom, 9)
                .padding(.leading, 18)
                
                Text(foodItem.foodDescription)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
