//
//  EdTechApp.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//

import SwiftUI

@main
struct EdTechApp: App {
    @StateObject var authVM = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authVM.isAuthenticated {
                MainTabView(authVM: authVM)
            } else {
                RegistrationView(authVM: authVM)
            }
        }
    }
}
