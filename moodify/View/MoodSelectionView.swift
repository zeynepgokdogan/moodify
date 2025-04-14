//
//  MoodSelectionView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct MoodSelectionView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("Mood Selection")
                    .font(.system(size: 40, weight: .bold, design: .default))
            }
            VStack(alignment : .leading, spacing: 10){
                MoodButton(label:"🙂 Happy") {}
                MoodButton(label:"🙁 Sad") {}
                MoodButton(label:"😡 Angry") {}
                MoodButton(label:"😌 Calm") {}
                MoodButton(label:"🙂 Happy") {}
                MoodButton(label:"🥳 Excited") {}
            }
            GenerateButton(label: "Generate Playlist") {}
        }
    }
}

#Preview {
    MoodSelectionView()
}
