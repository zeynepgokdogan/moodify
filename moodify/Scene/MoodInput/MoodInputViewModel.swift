//
//  MoodInputViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

@MainActor
class MoodInputViewModel: ObservableObject {
    private let moodService = MoodApiService()
    @Published var inputText = ""
    @Published var mood = ""
    
    func fetchMoods() async -> [String] {
        let sentiment = await moodService.fetchMood(text: inputText)
        self.mood = sentiment
        
        return [
            "happy",
            "sad",
            "angry",
            "calm",
            "excited",
            "inspired",
            "lonely",
            "motivation"
        ]
    }
    
}

