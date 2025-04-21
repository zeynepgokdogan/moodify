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
                    ForEach(moodModel, id: \.name) { mood in
                        MoodButton(
                            label: "\(mood.emoji)" + "mood_\(mood.name)".localized
                        ) {
                            
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    MoodSelectionView()
}
