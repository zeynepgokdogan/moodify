//
//  GenerateButton.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct GenerateButton: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            Text(label)
                .padding(20)
                .frame(width: 200)
                .foregroundStyle(.white)
                .background(Color.AppPrimary.Pink)
                .cornerRadius(12)
        }
    }
}


#Preview {
    GenerateButton(label: "Mood") { print("Çalıştı") }
}

