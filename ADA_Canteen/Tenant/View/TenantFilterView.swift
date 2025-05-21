//
//  TenantFilterView.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct TenantFilterView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var filterModel: TenantFilterModel
    
    let categories = ["kategori.Ayam", "kategori.Sayur", "kategori.Ikan", "kategori.Sapi", "kategori.Cabe", "kategori.Minuman", "kategori.Processed", "kategori.Kacang"]
    
    @State private var minPriceText: String = ""
    @State private var maxPriceText: String = ""
    
    var body: some View {
        VStack {
            header
            filterContent
            actionButtons
        }
        .accentColor(Color("aksen"))
        .onAppear {
            if let min = filterModel.minPrice {
                minPriceText = "\(min)"
            }
            if let max = filterModel.maxPrice {
                maxPriceText = "\(max)"
            }
        }
    }
    
    private var header: some View {
        HStack {
            Text("Filter Tenant")
                .font(.title2.bold())
            Spacer()
            Button(action: { dismiss() }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
    }
    
    private var filterContent: some View {
        ScrollView {
            VStack(spacing: 20) {
                categorySection
                priceSection
            }
            .padding()
        }
    }
    
    private var categorySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Kategori")
                .font(.headline)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    categoryButton(category)
                }
            }
        }
    }
    
    private func categoryButton(_ category: String) -> some View {
        let isSelected = filterModel.selectedCategories.contains(category)
        let displayName = category.replacingOccurrences(of: "kategori.", with: "")
        
        return Button(action: {
            filterModel.toggleCategory(category)
        }) {
            HStack(spacing: 6) {
                Image(category)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text(displayName)
                    .font(.system(size: 11))
                    .lineLimit(1)
                Spacer()
            }
            .padding(.horizontal, 10)
            .frame(height: 40)
            .background(isSelected ? Color.accentColor.opacity(0.2) : Color.gray.opacity(0.1))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isSelected ? Color.accentColor : Color.clear, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
        .foregroundColor(.primary)
    }
    
    private var priceSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Range Harga")
                .font(.headline)
            
            HStack(spacing: 10) {
                priceField(title: "Minimum", text: $minPriceText)
                Text("-").foregroundColor(.secondary)
                priceField(title: "Maximum", text: $maxPriceText)
            }
            
            if !filterModel.priceRangeText.isEmpty {
                Text(filterModel.priceRangeText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private func priceField(title: String, text: Binding<String>) -> some View {
        HStack {
            Text("Rp")
                .foregroundColor(.secondary)
            TextField(title, text: text)
                .keyboardType(.numberPad)
                .onChange(of: text.wrappedValue) { oldValue, newValue in
                    let filtered = newValue.filter { $0.isNumber }
                    if filtered != newValue {
                        text.wrappedValue = filtered
                    }
                    
                    if title == "Minimum" {
                        filterModel.minPrice = filtered.isEmpty ? nil : Int(filtered)
                    } else {
                        filterModel.maxPrice = filtered.isEmpty ? nil : Int(filtered)
                    }
                }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
    
    private var actionButtons: some View {
        HStack(spacing: 16) {
            Button(action: {
                filterModel.reset()
                minPriceText = ""
                maxPriceText = ""
                dismiss()
            }) {
                Text("Reset")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(10)
            }
            
            Button(action: {
                dismiss()
            }) {
                Text("Terapkan")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    TenantFilterView(filterModel: .constant(TenantFilterModel()))
}
