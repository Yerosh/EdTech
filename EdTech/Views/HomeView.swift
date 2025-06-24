//
//  HomeView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 15.06.2025.
//

import SwiftUI

struct HomeView: View {
    var user: User
    
    var body: some View {
        VStack {
            Image(user.avatarName)
                .frame(width: 32, height: 32)
        }
       
    }
}

#Preview {
    HomeView(user: User(avatarName: "avatar1", username: "yerosh", password: "qwerty", firstName: "Yernur", lastName: "Adilbek", parentEmail: "adilbekernur@gmail.com"))
}
