//
//  Text+CustomStyle.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import SwiftUI

extension Text {
    func customStyle(
        _ style: CustomText.FontStyle
    ) -> some View {
        self.font(
            .system(
                size: style.size,
                weight: style.weight,
                design: .default
            )
        )
        .foregroundColor(
            style.color
        )
        .opacity(
            style.opacity
        )
    }
}
