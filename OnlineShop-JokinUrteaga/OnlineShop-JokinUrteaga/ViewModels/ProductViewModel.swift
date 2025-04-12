//
//  EventViewModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

class ProductViewModel : ObservableObject {
    
    @Published var products : [Product] = []
    
    func fetchProducts(){
        guard let url = URL(string : "\(API.baseURL)/products") else{return}
        URLSession.shared.dataTask(with: url){ data , response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Product].self, from: data){
                    DispatchQueue.main.async{
                        self.products = decodedResponse
                    }
                }
            }
        }.resume()
    }
    
    func addProductToMyCart(productId: Int, userId: Int){
        //Queda por analizar lo que me hace falta aquí.
    }
}
