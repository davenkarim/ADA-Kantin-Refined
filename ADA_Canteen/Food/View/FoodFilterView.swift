//
//  FoodFilterView.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct FoodFilterView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: FoodFilterViewModel
    
    init(filterModel: FoodFilterModel) {
        self.viewModel = FoodFilterViewModel(filterModel: filterModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            headerSection
            filterContent
            actionButtons
        }
        .accentColor(Color("aksen"))
    }
    
    // MARK: - Subviews
    
    private var headerSection: some View {
        HStack {
            Text("Filter Makanan")
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
                categoryFilterSection
                priceFilterSection
            }
            .padding()
        }
    }
    
    private var categoryFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Kategori")
                .font(.headline)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], spacing: 10) {
                ForEach(viewModel.categories, id: \.self) { category in
                    categoryButton(category)
                }
            }
        }
    }
    
    private func categoryButton(_ category: String) -> some View {
        let isSelected = viewModel.filterModel.selectedCategories.contains(category)
        let displayName = category.replacingOccurrences(of: "kategori.", with: "")
        
        return Button(action: {
            viewModel.filterModel.toggleCategory(category)
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
    
    private var priceFilterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack (alignment: .leading) {
                Text("Harga Maksimum")
                    .font(.headline)
                    .padding(.bottom, 1)
                Text("Input tidak bisa melebihi Rp 50.000")
                    .font(.caption)
                    .italic()
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text("Rp")
                    .foregroundColor(.secondary)
                
                TextField("Masukkan Harga Maksimum", text: $viewModel.maxPriceText)
                    .keyboardType(.numberPad)
                    .onChange(of: viewModel.maxPriceText) {
                        viewModel.updateMaxPrice()
                    }
                    .textFieldStyle(.roundedBorder)
                
                if !viewModel.maxPriceText.isEmpty {
                    Button(action: {
                        viewModel.maxPriceText = ""
                        viewModel.filterModel.maxPrice = 50000
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                    }
                    .transition(.opacity)
                }
            }
            
            if viewModel.filterModel.maxPrice < 50000 {
                Text("Maks: Rp\(Int(viewModel.filterModel.maxPrice).formattedWithSeparator)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    private var actionButtons: some View {
        HStack(spacing: 16) {
            Button(action: {
                viewModel.resetFilters()
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


// MARK: - Preview

struct FoodFilterView_Previews: PreviewProvider {
    static var previews: some View {
        FoodFilterView(filterModel: FoodFilterModel())
    }
}
