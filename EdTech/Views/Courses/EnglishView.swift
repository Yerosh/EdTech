//
//  EnglishView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 12.08.2025.
//

import SwiftUI

struct EnglishView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let sections: [Section] = [
        Section(imageName: "vocabulary", title: "Пополни словарный запас", destination: AnyView(VocabularyView())),
        Section(imageName: "fairy", title: "Сказки", destination: AnyView(FairyView())),
        Section(imageName: "gramma", title: "Грамматика", destination: AnyView(GrammaView())),
        Section(imageName: "other", title: "Прочее", destination: AnyView(OthersView()))
    ]

    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                
                // Title
                Text("Разделы")
                    .font(.custom("Spline Sans", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("0D171C"))
                
                // Custom vertical list (no scroll)
                VStack(spacing: 16) {
                    ForEach(sections) { section in
                        NavigationLink(destination: section.destination) {
                            HStack(spacing: 12) {
                                Image(section.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text(section.title)
                                    .font(.custom("Spline Sans", size: 18))
                                    .foregroundColor(Color("0D171C"))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal)
            .navigationBarBackButtonHidden()
            .navigationTitle("Английский")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("chevronLeft")
                            .foregroundColor(.black)
                    }
                }
            }
            .background(Color("F7F7F9"))
        
        }
    
}

#Preview {
    EnglishView()
}
