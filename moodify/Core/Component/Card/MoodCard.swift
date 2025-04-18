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
        HStack(spacing: 20)
        {
            Image("playlist_cover")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text(playlistName)
                    .customStyle(CustomText.caption)
                Text(artistName)
                    .customStyle(CustomText.explanation)
            }
            
            Spacer()
        }
        .frame(width: 300)
        .padding()
        .background(.blue.opacity(0.3))
        .cornerRadius(15)
    }
}

#Preview {
    MoodCard(playlistName: "Playlist Name", artistName: "Artist Name")
}
