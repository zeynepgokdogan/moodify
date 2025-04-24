//
//  MoodResultViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

class MoodResultViewModel: ObservableObject {
    @Published var mood: String
    
    init(mood : String){
        self.mood = mood
        fetchPlaylist()
    }
    
    func fetchPlaylist() {
    }


}
