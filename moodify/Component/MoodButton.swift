//
//  MoodButton.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct MoodButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .customStyle(CustomText.subheading)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.black, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white.opacity(0.15)))
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MoodButton(label: "Mood") {
        print("Çalıştı")
    }
}
