//
//  PlaylistCardView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 28.04.2025.
//

import SwiftUI

struct PlaylistCard: View {
    let playlist: SpotifyService.Playlist
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 16) {
                if let imageUrl = playlist.images?.first?.url,
                   let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .playlistImageStyle()
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image("playlist")
                        .playlistImageStyle()
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(playlist.name)
                        .customStyle(CustomText.caption)
                    
                    Text("open_spotify")
                        .customStyle(CustomText.explanation)
                }
                Spacer()
                Image(systemName: "arrow.up.right.square")
                    .foregroundColor(Color.AppPrimary.Pink)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    PlaylistCard(
        playlist: SpotifyService.Playlist(
            id: "123",
            name: "Chill Hits",
            uri: "spotify:playlist:xyz",
            images: [SpotifyService.Playlist.SpotifyImage(url: "https://i.scdn.co/image/ab67616d0000b273d0b5ea6fc5c447d0f07a8b77")]
        ),
        onTap: {}
    )
}

