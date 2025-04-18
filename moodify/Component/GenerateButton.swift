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
                .customStyle(CustomText.subheading)
                .padding()
                .background(Color.AppPrimary.Pink)
                .cornerRadius(15)
        }
    }
}


#Preview {
    GenerateButton(label: "Mood") { print("Çalıştı") }
}

