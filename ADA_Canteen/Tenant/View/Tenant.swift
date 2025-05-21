import SwiftUI

struct TenantView: View {
    @StateObject private var viewModel = TenantViewModel()
    @State private var isFilterViewPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                searchBar
                headerSection
                filterInfoSection
                tenantList
            }
            .sheet(isPresented: $isFilterViewPresented) {
                TenantFilterView(filterModel: $viewModel.filterModel)
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Cari Tenant yang Kamu Mau Yuk..", text: $viewModel.searchText)
                    .font(.system(size: 14, weight: .light))
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
            
            filterButton
        }
        .padding()
    }
    
    private var filterButton: some View {
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
    
    private var headerSection: some View {
        Text("Tenants")
            .font(.title)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    private var filterInfoSection: some View {
        Group {
            if !viewModel.filterModel.selectedCategories.isEmpty ||
                viewModel.filterModel.minPrice != nil ||
                viewModel.filterModel.maxPrice != nil {
                Text(viewModel.generateFilterText())
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
            }
        }
    }
    
    private var tenantList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.filteredTenants) { tenant in
                    NavigationLink(destination: TenantDetailView(tenant: tenant)) {
                        TenantRow(tenant: tenant)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    if tenant.id != viewModel.filteredTenants.last?.id {
                        Divider()
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    TenantView()
}
