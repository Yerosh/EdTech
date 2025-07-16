//
//  HomeView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 15.06.2025.
//

import SwiftUI

struct HomeView: View {
    var user: User
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(user.avatarName)
                .resizable()
                .frame(width: 32, height: 32)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("4A829C"))

                CustomTextField(
                    placeholder: "Поиск",
                    text: $searchText
                )
            }
            .padding(12)
            .background(Color("E8F0F2"))
            .cornerRadius(12)
            
            Text("Уроки")
                .font(.custom("Spline Sans", size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("0D171C"))
                
            
            Spacer()
        
        }
        .padding(.horizontal)
        .padding(.top)
       
    }
}

#Preview {
    HomeView(user: User(avatarName: "avatar1", email: "yerosh", password: "qwerty", firstName: "Yernur", lastName: "Adilbek", userType: "adilbekernur@gmail.com"))
}
