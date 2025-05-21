//
//  TenantRow.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct TenantRow: View {
    let tenant: TenantItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(tenant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(tenant.name)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(tenant.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .italic()
                
                HStack(spacing: 4) {
                    ForEach(tenant.tags, id: \.self) { tag in
                        Image(tag)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Spacer()
                    Text(tenant.priceRangeString)
                        .font(.caption)
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}
