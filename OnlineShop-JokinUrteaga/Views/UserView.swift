//
//  UserView.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//
import SwiftUI

struct UserView: View {
    
    @ObservedObject var authVM: AuthViewModel
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            if let user = authVM.user {
                Text("Bienvenido, \(user.username)!")
                Button("Cerrar sesión") {
                    authVM.logout()
                }
                .padding()
                .background(Color("PrimaryColor"))
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                TextField("johnd", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textCase(.lowercase)
                    .padding()
                SecureField("m38rmF$", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Iniciar sesión") {
                    authVM.login(username: username, password: password)
                }
                .padding()
                .background(Color("PrimaryColor"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
}
#Preview {
    UserView(authVM: AuthViewModel())
}
