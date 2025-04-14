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
    @StateObject var cartVM: CartViewModel = CartViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Spacer()
                AsyncImage(url: URL(string: product.image)){
                    image in image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                    .frame(height: 200)
                    .foregroundStyle(.red)
                    .cornerRadius(12)
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("Descripción: \(product.description)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Precio: \(product.price)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 3)
                
                    Button("Añadir al carrito") {
                        cartVM.addProductToMyCart(product: product)
                        print("Producto añadido")
                    }
                    .padding()
                    .background(Color("PrimaryColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
            .padding()
        }
        //.navigationTitle("Detalles del Evento")
    }
}
#Preview {
    ProductDetailView(
        product: Product(id: 0, title: "Producto de ejemplo", price: 23.5, description: "Descripción del producto de ejemplo.", category: "Categoría de ejemplo", image: "https://i0.wp.com/www.redefineyouredge.com/wp-content/uploads/2021/05/32.-What-I_ve-learned-about-indifference.png?w=1280&ssl=1", rating: Rating(rate: 3.9, count: 120)),
        authVM: AuthViewModel(),
        cartVM: CartViewModel()
    )
}
