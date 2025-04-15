//
//  ContentView.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var cartVM = CartViewModel()

    var body: some View {        
        Text("Mi Tienda")
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .font(.system(size: 26, weight: .bold))
            .padding()
            .cornerRadius(10)
        TabView{
            Tab("Store", systemImage: "house.fill"){
                StoreView()
            }
            Tab("Usuario", systemImage: "person.fill"){
                UserView(authVM: authVM)
            }
            
            Tab("Carrito", systemImage: "cart.fill"){
                CartView(cartVM: cartVM)
            }
            .badge("\(cartVM.products?.count ?? 0)")
        }
        
    }
}

struct StoreView: View {
    
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var productVM = ProductViewModel()
    @StateObject private var cartVM = CartViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                List(productVM.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product, authVM: authVM, cartVM: cartVM)) {
                        HStack {
                            AsyncImage(url: URL(string: product.image)){
                                image in image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView()
                            }
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.headline)
                                    .foregroundStyle(Color("PrimaryColor"))
                                    .foregroundColor(.primary)
                                Text(String(product.price))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                //.navigationTitle("Atrápalo")
                .onAppear { productVM.fetchProducts() }
                Spacer()
            }
        }
    }
}
