//
//  MoodInputViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

struct MoodInputViewModel {
    private let moodService = MoodService()
    
    func fetchMoods() -> [String] {
        moodService.fetchMood(for: inputText) { sentiment in
                           mood = sentiment
                       }
        return ["Happy", "Sad", "Angry", "Surprised", "Fearful"]
    }
}
