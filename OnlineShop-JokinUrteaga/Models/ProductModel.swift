//
//  ProductModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

struct Product : Identifiable, Codable {
    var id : Int
    var product_title : String
    var product_price : Double
    var product_description : String
    var product_category : String
    var product_image : String
    
    var product_rating : Rating
}
