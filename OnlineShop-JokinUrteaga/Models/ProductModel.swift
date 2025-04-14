//
//  ProductModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

struct Product : Identifiable, Codable {
    var id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image : String
    
    var rating : Rating
}
