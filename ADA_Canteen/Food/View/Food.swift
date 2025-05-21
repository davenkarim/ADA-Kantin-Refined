import SwiftUI

struct FoodView: View {
    @StateObject private var viewModel = FoodViewModel()
    @State private var isFilterViewPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                searchBar
                
                VStack {
                    headerSection
                    
                    if !viewModel.filterModel.selectedCategories.isEmpty || viewModel.filterModel.maxPrice < 50000 {
                        filterInfoSection
                    }
                    
                    foodGrid
                }
                .padding(.top, 8)
                .sheet(isPresented: $isFilterViewPresented) {
                    FoodFilterView(filterModel: viewModel.filterModel)
                }
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Cari Makanan yang Kamu Mau Yuk..", text: $viewModel.searchText)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black)
                
                if !viewModel.searchText.isEmpty {
                    Button(action: {
                        viewModel.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Button {
                isFilterViewPresented = true
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color("aksen"))
            }
        }
        .padding()
    }
    
    private var headerSection: some View {
        Text("Makanan")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    private var filterInfoSection: some View {
        Text(viewModel.generateFilterText())
            .font(.subheadline)
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 8)
    }
    
    private var foodGrid: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ],
                spacing: 16
            ) {
                ForEach(viewModel.filteredFoodItems) { item in
                    NavigationLink(destination: FoodDetailView(foodItem: item)) {
                        FoodCard(item: item)
                            .frame(width: 150)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    FoodView()
}
