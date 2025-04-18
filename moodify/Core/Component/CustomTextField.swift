//
//  CustomTextfield.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .font(.custom("AvenirNext-Regular", size: 18))
                    .foregroundColor(.gray)
                    .padding(.horizontal, 50)
            }
            
            TextField("", text: $text)
                .font(.custom("AvenirNext-Regular", size: 18))
                .multilineTextAlignment(.leading)
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled(true)
                .padding(.horizontal, 50)
                .frame(height: 50)
                .background(Color.gray.opacity(0.1))
        }
        .frame(height: 100)
        .padding(.horizontal,10)
    }
}
