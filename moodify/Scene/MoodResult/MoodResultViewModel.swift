//
//  MoodResultViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation
import UIKit

class MoodResultViewModel: ObservableObject {
    @Published var mood: String
    @Published var playlists: [SpotifyService.Playlist] = []
    @Published var isLoading: Bool = false
    
    private let spotifyService = SpotifyService()
    
    init(mood: String) {
        self.mood = mood
        fetchPlaylist()
    }
    
    func fetchPlaylist() {
        self.isLoading = true
        spotifyService.getAccessToken { [weak self] token in
            guard let token = token else {
                print("The access token was not received.")
                self?.isLoading = false
                return
            }
            self?.spotifyService.fetchPlaylist(for: self?.mood ?? "", accessToken: token) { playlists in
                print("Received playlists: \(playlists)")
                DispatchQueue.main.async {
                    self?.playlists = playlists
                    self?.isLoading = false
                }
            }
        }
    }
    
    func openSpotify(for uri: String) {
        let urlString = uri.replacingOccurrences(
            of: "spotify:playlist:",
            with: "https://open.spotify.com/playlist/"
        )
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
}

