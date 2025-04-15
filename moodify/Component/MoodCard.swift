//
//  MoodCard.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 15.04.2025.
//

import SwiftUI

struct MoodCard: View {
    let playlistName: String
    let artistName: String
    
    var body: some View {
        HStack
        {
            Image("playlistImage")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text(playlistName)
                    .font(.headline)
                Text(artistName)
                    .font(.caption)
            }
        }
        .frame(width: 300)
        .padding()
        .background(.white.opacity(0.8))
        .cornerRadius(10)
    }
}

#Preview {
    MoodCard(playlistName: "Playlist Name", artistName: "Artist Name")
}
