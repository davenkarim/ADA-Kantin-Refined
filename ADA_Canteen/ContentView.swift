import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
        UITabBar.appearance().tintColor = UIColor(Color("aksen"))
    }
    
    var body: some View {
        TabView {
            FoodView()
                .tabItem {
                    VStack {
                        Image(systemName: "fork.knife")
                        Text("Makanan")
                    }
                }
            TenantView()
                .tabItem {
                    VStack {
                        Image(systemName: "storefront.fill")
                        Text("Tenant")
                            .fontWeight(.black)
                    }
                }
        }
        .accentColor(Color("aksen"))
    }
}

#Preview {
    ContentView()
}

