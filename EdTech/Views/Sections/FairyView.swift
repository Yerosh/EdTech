//
//  FairyView.swift
//  EdTech
//
//  Created by Yernur Adilbek on 19.08.2025.
//

import SwiftUI

struct FairyView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    @State private var fairies: [Fairy] = [
        Fairy(imageName: "fairy1", title: "Три поросенка"),
        Fairy(imageName: "fairy2", title: "Черепаха и Заяц"),
        Fairy(imageName: "fairy3", title: "Маленький Дом"),
        Fairy(imageName: "fairy4", title: "Гадкий утёнок"),
        Fairy(imageName: "fairy5", title: "Златовласка и три медведя"),
        Fairy(imageName: "fairy6", title: "Маленькая красная курочка ")
    ]
    
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
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
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(fairies) { fairy in
                        VStack(alignment: .leading, spacing: 8) {
                            Image(fairy.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 160)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Text(fairy.title)
                                .font(.custom("Spline Sans", size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("0D171C"))
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.horizontal)
        .navigationBarBackButtonHidden()
        .navigationTitle("Сказки")
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
    FairyView()
}
