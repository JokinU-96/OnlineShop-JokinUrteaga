//
//  CartView.swift
//  OnlineShop-JokinUrteaga
//
//  Created by  on 7/4/25.
//

import SwiftUI

struct CartView: View{
    
    @ObservedObject var cartVM : CartViewModel
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        VStack{
            if let user = authVM.user {
                Text("Carrito de \(user.username)!")
            } else {
                
                NavigationLink(
                    "Iniciar sesión", destination: UserView(authVM: authVM)
                )
                .padding()
                .background(Color("PrimaryColor"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
    }
    
}
