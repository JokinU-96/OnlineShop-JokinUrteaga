//
//  EventDetailView.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
    @StateObject var authVM: AuthViewModel = AuthViewModel()
    @StateObject var productVM: ProductViewModel = ProductViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                Image(systemName: "photo")  // Imagen de evento por defecto
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundStyle(.red)
                    .opacity(0.5)
                    .cornerRadius(12)
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.product_title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("Descripción: \(product.product_description)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Precio: \(product.product_price)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 3)
                
                if let user = authVM.user {
                    Button("Añadir al carrito") {
                        productVM.addProductToMyCart(productId: product.id, userId: user.id)
                        print("Producto añadido")
                    }
                    .padding()
                    .background(Color("PrimaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
        }
        //.navigationTitle("Detalles del Evento")
    }
}
#Preview {
    ProductDetailView(
        product: Product(id: 0, product_title: "Producto de ejemplo", product_price: 23.5, product_description: "Descripción del producto de ejemplo.", product_category: "Categoría de ejemplo", product_image: "sin imagen", product_rating: Rating(product_rate: 3.9, product_count: 120)),
        authVM: AuthViewModel(),
        productVM: ProductViewModel()
    )
}
