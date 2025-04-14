//
//  CartViewModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

class CartViewModel: ObservableObject{
    
    @Published var products : [Product]? = []
    
    init() {
        cargarProductos()
    }
    
    func addProductToMyCart(product: Product){
        products?.append(product)
        guardarProductos()
    }
    
    func limpiarCarrito(){
        products?.removeAll()
        guardarProductos()
    }
    
    func gastoTotal()-> Double{
        var total: Double = 0
        if let productos = products{
            for producto in productos {
                total += producto.price
            }
        }
        return total
    }
    
    private func guardarProductos(){
        if let products = products, let encodeProducts = try? JSONEncoder().encode(products){
            UserDefaults.standard.set(encodeProducts, forKey: "products")
        }
    }
    
    private func cargarProductos(){
        if let savedProducts = UserDefaults.standard.data(forKey: "products"), let decodeProducts = try? JSONDecoder().decode([Product].self, from: savedProducts){
            self.products = decodeProducts
        } else {
            self.products = []
        }
    }
}
