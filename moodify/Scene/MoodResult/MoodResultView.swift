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
            MoodCard(
                playlistName: "playlist_name".localized,
                artistName: "artist_name".localized
            )
        }
        .navigationBarTitle(
            "mood_result_view_title".localized
        )
        .tint(Color.AppPrimary.Pink)
    }
    
}

#Preview {
    MoodResultView(viewModel: MoodResultViewModel(mood: "test"))
}
