//
//  MainTabView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var authVM: AuthViewModel
    
    var body: some View {
        TabView {
            HomeView(user: authVM.currentUser!)
                .tabItem { Label("Главная", systemImage: "house") }
            
            LibraryView()
                .tabItem { Label("Библиотека", systemImage: "bookmark") }
            
            TaskView()
                .tabItem { Label("Задания", systemImage: "person") }
            
            ProfileView()
                .tabItem { Label("Профиль", systemImage: "gear") }
        }
    }
}

//#Preview {
//    MainTabView(authVM: AuthViewModel)
//}
