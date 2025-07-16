//
//  CustomTextField.swift
//  EdTech
//
//  Created by Yernur Adilbek on 28.06.2025.
//
import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color("4A829C"))
            }
            
            TextField("", text: $text)
                .foregroundColor(Color("4A829C"))
        }
    }
}
