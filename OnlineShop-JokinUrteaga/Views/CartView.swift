//
//  CartView.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct CartView: View{
    
    @ObservedObject var cartVM : CartViewModel
    
    var body: some View {
        VStack{
            Text("Carrito de la compra.")
                List(cartVM.products) { product in
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
            if cartVM.products.count > 0 {
                Button("Comprar") {
                    print("Acabas de comprar los productos del carrito")
                }
                .padding()
                .background(Color("PrimaryColor"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
    
}
