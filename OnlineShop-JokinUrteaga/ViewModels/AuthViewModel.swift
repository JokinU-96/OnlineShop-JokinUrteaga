//
//  AuthViewModel.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

import SwiftUI
class AuthViewModel: ObservableObject {
    
    @Published var user: User? = nil
    @Published var token: String? = nil
    
    func login(username: String, password: String) {
        guard let url = URL(string: "\(API.baseURL)/auth/login") else {
            return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginData = LoginRequest(username: username, password: password)
        
        request.httpBody = try? JSONEncoder().encode(loginData)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data, let decodedResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.user = decodedResponse.user
                    self.token = decodedResponse.access_token
                    self.saveUserData()
                }
            }
        }.resume()
    }
    
    func logout() {
        self.user = nil
        self.token = nil
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.removeObject(forKey: "token")
    }
    
    private func saveUserData(){
        if let user = user, let encodeUser = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodeUser, forKey: "user")
        }
        if let token = token {
            UserDefaults.standard.set(token, forKey: "token")
        }
    }
    private func loadUserData(){
        if let savedUser = UserDefaults.standard.data(forKey: "user"), let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser){
            self.user = decodedUser
        }
        if let savedToken = UserDefaults.standard.string(forKey: "token"){
            self.token = savedToken
        }
    }
}
