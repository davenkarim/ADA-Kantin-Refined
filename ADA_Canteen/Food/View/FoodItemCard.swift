//
//  FoodItemCard.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct FoodCard: View {
    let item: FoodItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 180)
                .frame(width: 180)
                .cornerRadius(8)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                Text(item.location)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text("\(item.price)")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            .padding(.leading, 6)
            
            HStack(spacing: 4) {
                ForEach(item.tags, id: \.self) { tag in
                    Image(tag)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                .padding(.top, -6)
                Spacer()
            }
            .padding(.leading, 6)
        }
        .padding(.bottom, 8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}
