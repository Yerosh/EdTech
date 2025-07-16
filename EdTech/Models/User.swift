//
//  User.swift
//  EdTech
//
//  Created by Yernur Adilbek on 14.06.2025.
//
import Foundation


struct User: Identifiable, Codable {
    let id = UUID()
    let avatarName: String
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let userType: String
}
