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
    
    let courses: [Course] = [
        Course(imageName: "math", title: "Математика"),
        Course(imageName: "eng", title: "Англиский")
    ]
    
    let recommendedCourses: [Course] = [
        Course(imageName: "mathBeg", title: "Математика для начинающих"),
        Course(imageName: "engBeg", title: "Английский для начинающих"),
        Course(imageName: "math", title: "Математика"),
        Course(imageName: "eng", title: "Англиский")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(user.avatarName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 32, height: 32)
                .padding(.bottom, 28)
            
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
            .padding(.bottom, 32)
            
            Text("Курсы")
                .font(.custom("Spline Sans", size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("0D171C"))
                .padding(.bottom, 28)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(courses) { item in
                        VStack(alignment: .leading, spacing: 16) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 160)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Text(item.title)
                                .font(.custom("Spline Sans", size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("0D171C"))
                        }
                        .frame(width: 160)
                    }
                }
            }
            .padding(.bottom, 28)

            Text("Рекомендаций")
                .font(.custom("Spline Sans", size: 22))
                .fontWeight(.bold)
                .foregroundColor(Color("0D171C"))
                .padding(.bottom, 28)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(recommendedCourses) { item in
                        VStack(alignment: .leading, spacing: 16) {
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 160)
                                .background(Color.blue.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Text(item.title)
                                .font(.custom("Spline Sans", size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("0D171C"))
                        }
                        .frame(width: 160)
                    }
                }
            }
//            .padding(.bottom, 28)
            
//            Spacer()
        
        }
        .padding(.horizontal)
        .padding(.top)
       
    }
}

#Preview {
    HomeView(user: User(avatarName: "avatar6", email: "yerosh", password: "qwerty", firstName: "Yernur", lastName: "Adilbek", userType: "adilbekernur@gmail.com"))
}
