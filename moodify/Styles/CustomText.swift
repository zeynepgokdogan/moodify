//
//  CustomText.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import SwiftUI

struct CustomText {
    static let heading = FontStyle(size: 22, weight: .bold, color: .white, opacity: 0.8)
    
    static let subheading = FontStyle(size: 18, weight: .regular, color: .white, opacity: 0.8)
    
    static let body = FontStyle(size: 14, weight: .semibold, color: .gray, opacity: 0.8)
    
    static let caption = FontStyle(size: 16, weight: .regular, color: .white, opacity: 0.7)

    static let explanation = FontStyle(size: 15, weight: .regular, color: .white, opacity: 0.5)
    
    struct FontStyle {
        var size: CGFloat
        var weight: Font.Weight
        var color: Color
        var opacity: Double
    }
}


