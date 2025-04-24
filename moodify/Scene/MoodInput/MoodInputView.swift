//
//  MoodInputView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//
import SwiftUI

struct MoodInputView: View {
    @StateObject var viewModel = MoodInputViewModel()
    @State private var showResult = false
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 380, height: 300)
                Text("discover_music_suggestion".localized)
                    .customStyle(CustomText.heading)
                CustomTextField(placeholder: "mood_input_placeholder".localized , text: $viewModel.inputText)
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .customStyle(CustomText.subheading)
                        .padding(.bottom, 10)
                }
                
                GenerateButton(
                    label: "generate_playlist_button".localized
                ) {  Task{
                    let mood = await viewModel.detectMood()
                    if !mood.isEmpty {
                        showResult = true
                    }
                }}
                
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
            NavigationLink(
                destination: MoodResultView(viewModel: MoodResultViewModel(mood: viewModel.mood)),
                isActive: $showResult
            ) {
                EmptyView()
            }
            
        }
        .tint(Color.AppPrimary.Pink)
    }
}


#Preview {
    MoodInputView()
}
