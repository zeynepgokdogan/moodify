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
                .foregroundStyle(.black)

        }
    }
}


#Preview {
    MoodButton(label: "Mood") {
        print("Çalıştı")
    }
}
