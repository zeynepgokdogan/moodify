//
//  MoodSelectionView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct MoodSelectionView: View {
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("mood_selection_title".localized)
                    .customStyle(CustomText.heading)
                    .padding(.bottom, 100)
                LazyVGrid(columns: columns, spacing: 25) {
                    MoodButton(label:"mood_happy".localized) {}
                    MoodButton(label:"mood_sad".localized) {}
                    MoodButton(label:"mood_angry".localized) {}
                    MoodButton(label:"mood_calm".localized) {}
                    MoodButton(label:"mood_excited".localized) {}
                    MoodButton(label:"mood_romantic".localized) {}
                    MoodButton(label:"mood_inspired".localized) {}
                    MoodButton(label:"mood_lonely".localized) {}
                    MoodButton(label:"mood_motivation".localized) {}
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    MoodSelectionView()
}
