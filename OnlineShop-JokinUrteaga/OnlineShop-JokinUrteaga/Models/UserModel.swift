//
//  UserModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

struct User : Identifiable, Codable{
    var id : Int
    var username : String
    var email : String
}
