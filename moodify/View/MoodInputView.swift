//
//  MoodInputView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct MoodInputView: View {
    @State private var navigate = false
    @State var text: String = ""
    var body: some View {
        NavigationStack {
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 380, height: 300)
                Text("Discover Music That Feels Like You")
                    .font(.system(size: 16, weight: .bold, design: .default))
                TextField("How are you feeling today ?", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.custom("AvenirNext-Regular", size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .frame(height: 100)
                
                GenerateButton(label: "Generate Playlist") {}
                
                Spacer()
                Divider()
                    .padding(.vertical, 16)
                
                Text("Prefer choosing your mood manually?")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Button(action: {
                    navigate = true
                }) {
                    Label("Or Mood Selection", systemImage: "arrow.right.circle")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1.5)
                        )
                }
                
                
            }
            NavigationLink(destination: MoodSelectionView(), isActive: $navigate) {
                EmptyView()
            }
        }
    }
}

#Preview {
    MoodInputView()
}
