//
//  RegistrationViewModel.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var userType = ""
    @Published var selectedAvatar: String? = nil

    // Ошибки по каждому полю
    @Published var emailError: String?
    @Published var passwordError: String?
    @Published var confirmPasswordError: String?
    @Published var firstNameError: String?
    @Published var lastNameError: String?
    @Published var userTypeError: String?
    @Published var avatarError: String?

    @Published var registrationSuccess = false
    
    let userTypes = ["Ученик", "Родитель"]

    func validateInputs() -> Bool {
        // Сброс ошибок
        emailError = nil
        passwordError = nil
        confirmPasswordError = nil
        firstNameError = nil
        lastNameError = nil
        avatarError = nil

        var isValid = true

//        let usernameRegex = "^[a-zA-Z0-9]+$"
        let emailRegex = #"^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+(-[a-zA-Z0-9]+)?\.[a-zA-Z]{2,10}$"#

        if email.isEmpty {
            emailError = "Заполните обязательное поле"
            isValid = false
        } else if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email) {
            emailError = "Неверный формат email"
            isValid = false
        }

        if password.isEmpty {
            passwordError = "Заполните обязательное поле"
            isValid = false
        }

        if confirmPassword.isEmpty {
            confirmPasswordError = "Заполните обязательное поле"
            isValid = false
        } else if confirmPassword != password {
            confirmPasswordError = "Пароли не совпадают"
            isValid = false
        }

        if firstName.isEmpty {
            firstNameError = "Заполните обязательное поле"
            isValid = false
        }

        if lastName.isEmpty {
            lastNameError = "Заполните обязательное поле"
            isValid = false
        }

//        if parentEmail.isEmpty {
//            parentEmailError = "Заполните обязательное поле"
//            isValid = false
//        } else if !NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: parentEmail) {
//            parentEmailError = "Неверный формат email"
//            isValid = false
//        }
        
        if userType.isEmpty {
            userTypeError = "Выберите тип пользователя"
            isValid = false
        }

        if selectedAvatar == nil {
            avatarError = "Выберите аватар"
            isValid = false
        }

        return isValid
    }

    func register(authVM: AuthViewModel) {
        if validateInputs() {
            let user = User(
                avatarName: selectedAvatar!,
                email: email,
                password: password,
                firstName: firstName,
                lastName: lastName,
                userType: userType
            )
            authVM.register(user: user)
            registrationSuccess = true
        }
    }
}
