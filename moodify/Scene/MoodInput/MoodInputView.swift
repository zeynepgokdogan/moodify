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
                Text("discover_music_suggestion".localized)
                    .customStyle(CustomText.heading)
                CustomTextField(placeholder: "mood_input_placeholder".localized , text: $text)
                GenerateButton(label: "generate_playlist_button".localized) {}
                
                Spacer()
                Divider()
                    .frame(height: 2)
                    .padding(.vertical, 16)
                Text("manual_mood_selection_prompt".localized)
                    .customStyle(CustomText.subheading)
                Button(
                    action: {
                        navigate = true
                    })
                {
                    Label("mood_selection_navigation".localized, systemImage: "arrow.right.circle")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color.AppPrimary.Blue)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.AppPrimary.Blue, lineWidth: 1.5)
                        )
                }
                
            }
            NavigationLink(
                destination: MoodSelectionView(),
                isActive: $navigate
            ) {
                EmptyView()
            }
        }
    }
}


#Preview {
    MoodInputView()
}
