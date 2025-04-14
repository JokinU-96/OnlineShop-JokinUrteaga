//
//  CartViewModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

class CartViewModel: ObservableObject{
    
    var products : [Product] = []
    
    func addProductToMyCart(product: Product){
        products.append(product)
    }
}
