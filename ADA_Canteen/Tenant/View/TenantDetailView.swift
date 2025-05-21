//
//  TenantDetailView.swift
//  ADA Kantin
//
//  Created by Daven Karim on 09/05/25.
//

import SwiftUI

struct TenantDetailView: View {
    @StateObject private var viewModel: TenantDetailViewModel
    @State private var isFilterViewPresented = false
    
    init(tenant: TenantItem) {
        self._viewModel = StateObject(wrappedValue: TenantDetailViewModel(tenant: tenant))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                searchBar

                ScrollView {
                    VStack(spacing: 0) {
                        tenantHeader
                        menuGrid
                    }
                }
            }
            .sheet(isPresented: $isFilterViewPresented) {
                FoodFilterView(filterModel: viewModel.filterModel)
            }
        }
    }

    
    private var searchBar: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Cari Makanan dari Tenant ini Yuk..", text: $viewModel.searchText)
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
        .padding(.horizontal)
        .padding(.top)
        .padding(.bottom)
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
    
    private var tenantHeader: some View {
        ZStack(alignment: .bottom) {
            Image(viewModel.tenant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 130)
                .clipped()
            
            HStack(alignment: .bottom, spacing: 20) {
                Image(viewModel.tenant.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 5)
                    .offset(y: 30)
                    .padding(.leading, 20)
                
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(viewModel.tenant.name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                Text(viewModel.tenant.priceRangeString)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Text(viewModel.tenant.description)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
                    .italic()
                
                HStack(spacing: 8) {
                    ForEach(viewModel.tenant.tags, id: \.self) { tag in
                        Image(tag)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .offset(y: 145)
            .padding(.horizontal,14)
        }
        .padding(.bottom, 120)
    }
    
    private var menuGrid: some View {
        LazyVGrid(
            columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)],
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
        .padding(.top, 40)
    }
}

struct TenantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTenant = TenantItem(id: 5,
                                      name: "Kantin Kasturi",
                                      image: "kantinkasturi_img",
                                      logo: "kasturi.logo",
                                      minPrice: 3000,
                                      maxPrice: 17000,
                                      tags: ["kategori.Ayam", "kategori.Sapi", "kategori.Ikan", "kategori.Cabe", "kategori.Sayur"],
                                      description: "Mau makan cepat tapi tetap nikmat? Kantin Kasturi punya solusinya. Murah meriah, rasa enak banget!",
                                      foodItems: [
                                       FoodItem(name: "Cah Toge",
                                                price: 3000,
                                                image: "cah.toge",
                                                tags: ["kategori.Sayur", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Toge segar yang ditumis dengan bawang putih, cabai, dan bumbu rahasia kami. Hidangan sederhana namun penuh nutrisi dan rasa.",
                                                tenantId: 5),
                                       FoodItem(name: "Telur Dadar",
                                                price: 3000,
                                                image: "telur.dadar",
                                                tags: ["kategori.Sayur"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Telur dadar tebal dengan isian daun bawang dan bumbu rahasia. Sederhana tapi selalu memuaskan.",
                                                tenantId: 5),
                                       FoodItem(name: "Tempe Orek",
                                                price: 3500,
                                                image: "tempe.orek",
                                                tags: ["kategori.Sayur"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Tempe yang diiris tipis dan digoreng kering dengan bumbu manis pedas. Kriuk-kriuk yang bikin ketagihan.",
                                                tenantId: 5),
                                       FoodItem(name: "Ayam Bistik",
                                                price: 7000,
                                                image: "ayam.bistik",
                                                tags: [ "kategori.Ayam"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Potongan ayam empuk dipanggang atau digoreng dengan sempurna, disajikan dengan saus bistik khas yang manis-gurih, ditambah irisan bawang bombay dan paprika untuk cita rasa yang kaya. Cocok dinikmati dengan nasi hangat atau kentang tumbuk.",
                                                tenantId: 5),
                                       FoodItem(name: "Ayam Teriyaki",
                                                price: 7000,
                                                image: "ayam.teriyaki",
                                                tags: ["kategori.Ayam"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Ayam premium yang dimarinasi dengan saus teriyaki khas, dipanggang hingga kecokelatan dan disajikan dengan taburan wijen. Rasa manis-gurih yang seimbang.",
                                                tenantId: 5),
                                       FoodItem(name: "Sosis Oseng",
                                                price: 7000,
                                                image: "sosis.oseng",
                                                tags: ["kategori.Sapi", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Sosis premium yang dioseng dengan bawang bombay, cabai, dan bumbu spesial. Cocok untuk teman nasi hangat.",
                                                tenantId: 5),
                                       FoodItem(name: "Sapi Lada Hitam",
                                                price: 8000,
                                                image: "sapi.lada.hitam",
                                                tags: ["kategori.Sapi", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Daging sapi pilihan yang ditumis dengan lada hitam, bawang bombay, dan paprika. Gurih dan sedikit pedas.",
                                                tenantId: 5),
                                       FoodItem(name: "Ikan Cabe Garam",
                                                price: 8000,
                                                image: "ikan.cabe.garam",
                                                tags: ["kategori.Ikan", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Ikan segar yang digoreng krispi lalu ditumis dengan cabai dan bawang putih. Pedas gurih yang menggugah selera.",
                                                tenantId: 5),
                                       FoodItem(name: "Ayam Geprek",
                                                price: 17000,
                                                image: "ayam.geprek",
                                                tags: ["kategori.Ayam", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Ayam krispi ala geprek dengan sambal bawang yang pedasnya pas. Daging ayam yang juicy dengan lapisan tepung yang renyah.",
                                                tenantId: 5),
                                       FoodItem(name: "Ayam Penyet",
                                                price: 17000,
                                                image: "ayam.penyet",
                                                tags: ["kategori.Ayam", "kategori.Cabe"],
                                                location: "Kantin Kasturi",
                                                foodDescription: "Ayam kampung yang dimasak dengan bumbu rempah khas, disajikan dengan sambal terasi yang pedas menggigit.",
                                                tenantId: 5),
                                      ])

        TenantDetailView(tenant: sampleTenant)
    }
}

