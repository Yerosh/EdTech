//
//  Sections.swift
//  EdTech
//
//  Created by Yernur Adilbek on 19.08.2025.
//

import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let destination: AnyView
}
