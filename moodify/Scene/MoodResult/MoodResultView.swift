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
            if viewModel.playlists.isEmpty {
                Text("Playlist bulunamadı veya veriler yüklenemedi.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List(viewModel.playlists, id: \.uri) { playlist in
                    Text(playlist.name)
                }
            }
        }
        .onAppear {
            viewModel.fetchPlaylist()
        }
        .navigationBarTitle("mood_result_view_title".localized)
        .tint(Color.AppPrimary.Pink)
    }
}


#Preview {
    MoodResultView(viewModel: MoodResultViewModel(mood: "test"))
}
