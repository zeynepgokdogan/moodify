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
                Text("Mood Selection")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .padding(.bottom, 40)
                
                LazyVGrid(columns: columns, spacing: 25) {
                    MoodButton(label:"🙂 Happy") {}
                    MoodButton(label:"🙁 Sad") {}
                    MoodButton(label:"😡 Angry") {}
                    MoodButton(label:"😌 Calm") {}
                    MoodButton(label:"🙂 Happy") {}
                    MoodButton(label:"🥳 Excited") {}
                    MoodButton(label:"❤️ Romantic") {}
                    MoodButton(label:"💡 Inspired") {}
                    MoodButton(label:"😔 Lonely") {}
                    MoodButton(label:"💪 Motivation") {}
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    MoodSelectionView()
}
