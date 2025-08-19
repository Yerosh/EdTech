//
//  RegistrationView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @ObservedObject var authVM: AuthViewModel

    let avatars = ["avatar1", "avatar2", "avatar3", "avatar4", "avatar5", "avatar6", "avatar7", "avatar8"]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Давайте начнем!")
                    .font(.custom("Spline Sans", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("0D171C"))
                
                Text("Выбери аватар, чтобы персонализировать свой процесс обучения.")
                    .font(.custom("Spline Sans", size: 16))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(Color("0D171C"))
                    
                Text("Выбери свой аватар")
                    .foregroundColor(Color("0D171C"))
                    .font(.custom("Spline Sans", size: 18))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 32) {
                        ForEach(avatars, id: \.self) { avatar in
                            Image(avatar)
                                .resizable()
                                .frame(width: 128, height: 128)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(viewModel.selectedAvatar == avatar ? Color.blue : Color.clear, lineWidth: 3)
                                )
                                .onTapGesture {
                                    viewModel.selectedAvatar = avatar
                                }
                        }
                    }
                }
                .frame(height: 176)
                
                if let avatarError = viewModel.avatarError {
                    Text(avatarError).foregroundColor(.red).font(.caption)
                }

                Text("Информация")
                    .font(.custom("Spline Sans", size: 18))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(Color("0D171C"))
                    .padding(.bottom, 12)
                Group {
                    validatedField(title: "Email", text: $viewModel.email, error: viewModel.emailError)
                    validatedField(title: "Пароль", text: $viewModel.password, error: viewModel.passwordError)
                    validatedField(title: "Повторите пароль", text: $viewModel.confirmPassword, error: viewModel.confirmPasswordError)
                    validatedField(title: "Имя", text: $viewModel.firstName, error: viewModel.firstNameError)
                    validatedField(title: "Фамилия", text: $viewModel.lastName, error: viewModel.lastNameError)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Тип пользователя")
                            .font(.custom("Spline Sans", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(Color("0D171C"))
                        
                        if let userTypeError = viewModel.userTypeError {
                            Text(userTypeError)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                        
                        Menu {
                            ForEach(viewModel.userTypes, id: \.self) { type in
                                Button {
                                    viewModel.userType = type
                                } label: {
                                    Text(type)
                                        .foregroundColor(Color("0D171C"))
                                }
                            }
                        } label: {
                            HStack {
                                Text(viewModel.userType.isEmpty ? "" : viewModel.userType)
                                    .foregroundColor(viewModel.userType.isEmpty ? .gray : Color("0D171C"))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Image("dropdown")
                                    .foregroundColor(Color("4A829C"))
                            }
                            .padding(12)
                            .background(Color("E8F0F2"))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(viewModel.userTypeError != nil ? Color.red : Color.clear, lineWidth: 1)
                            )
                        }
                    }

                }
                

                Button("Создать аккаунт") {
                    viewModel.register(authVM: authVM)
                }
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .background(Color("42B2EB"))
                .foregroundColor(Color("0D171C"))
                .cornerRadius(24)
                .padding(.vertical, 41)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $viewModel.registrationSuccess) {
            LoginView(authVM: authVM)
        }
    }

    // Обёртка для поля ввода с ошибкой
    func validatedField(title: String, text: Binding<String>, error: String?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.custom("Spline Sans", size: 16))
                .fontWeight(.regular)
                .foregroundColor(Color("0D171C"))
            
            if let error = error {
                Text(error).foregroundColor(.red).font(.caption)
            }
            TextField("", text: text)
                .padding(12)
                .background(Color("E8F0F2"))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(error != nil ? Color.red : Color.clear, lineWidth: 1)
                )
        }
    }

}




#Preview {
    RegistrationView(authVM: AuthViewModel())
}
