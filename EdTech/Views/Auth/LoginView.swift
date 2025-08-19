//
//  LoginView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 15.06.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Image("loginImage")
            
            TextField("Email", text: $email)
                .padding(12)
                .background(Color("E8F0F2"))
                .cornerRadius(12)
            
            TextField("Пароль", text: $password)
                .padding(12)
                .background(Color("E8F0F2"))
                .cornerRadius(12)
                .padding(.top, 12)
            
            Button("Войти") {
                authVM.login(username: email, password: password)
            }
            .frame(width: 84, height: 40)
            .background(Color("42B2EB"))
            .foregroundColor(.white)
            .cornerRadius(24)
            .padding(.vertical, 12)
            .font(.custom("Spline Sans", size: 14))
            .fontWeight(.semibold)
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

    }
}

#Preview {
    LoginView(authVM: AuthViewModel())
}
