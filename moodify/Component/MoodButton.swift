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
                .font(.title2)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                )
                .shadow(radius: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    MoodButton(label: "Mood") {
        print("Çalıştı")
    }
}
