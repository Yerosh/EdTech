//
//  AuthViewModel.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated = false
    private var users: [User] = []

    func register(user: User) {
        users.append(user)
    }

    func login(username: String, password: String) {
        if let user = users.first(where: { $0.email == username && $0.password == password }) {
            currentUser = user
            isAuthenticated = true
        }
    }

    func logout() {
        currentUser = nil
        isAuthenticated = false
    }
}

