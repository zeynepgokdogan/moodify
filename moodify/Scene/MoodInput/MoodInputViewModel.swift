//
//  MoodInputViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

@MainActor
class MoodInputViewModel: ObservableObject {
    private let textAnalysisService = TextAnalysisService()
    @Published var inputText = ""
    @Published var mood: String = ""
    @Published var errorMessage = ""
    
    func detectMood() async -> String {
        guard validate() else{
            return ""
        }
        let detectedMood = await textAnalysisService.detectMood(text: inputText)
        self.mood = detectedMood
        return mood
    }
    
    func validate() -> Bool {
        guard !inputText.isEmpty else {
            errorMessage = "error_message_empty_text".localized
            return false
        }
        return true
    }
    
    func reset() {
        inputText = ""
        errorMessage = ""
        mood = ""
    }
    
}
