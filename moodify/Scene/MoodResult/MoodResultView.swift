//
//  MoodResultView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

struct MoodResultView: View {
    @StateObject var viewModel: MoodResultViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                } else if viewModel.playlists.isEmpty {
                    VStack {
                        Image(systemName: "music.note.list")
                            .playlistImageStyle()
                        Text("playlist_not_found".localized)
                            .foregroundColor(.gray)
                            .padding()
                    }
                } else {
                    List(viewModel.playlists, id: \.uri) { playlist in
                        PlaylistCard(playlist: playlist) {
                            viewModel.openSpotify(for: playlist.uri)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("mood_result_view_title".localized)
            .tint(Color.AppPrimary.Pink)
        }
        .onAppear {
            viewModel.fetchPlaylist()
        }
    }
}


#Preview {
    MoodResultView(viewModel: MoodResultViewModel(mood: "dolu kadehi ters tut"))
}

