//
//  LoginResponse.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

struct LoginResponse: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let user: User
}
