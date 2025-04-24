//
//  MoodSelectionViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

@MainActor
class MoodSelectionViewModel: ObservableObject {
    @Published var inputText = ""
    @Published var mood: String = ""
    
    func selectMood(string: String) async -> String {
        return mood
    }
    
}
