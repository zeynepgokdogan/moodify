//
//  MoodResultViewModel.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

class MoodResultViewModel: ObservableObject {
    func searchPlaylist(keyword: String, token: String, completion: @escaping ([SpotifyPlaylist]) -> Void) {
        let query = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let urlString = "https://api.spotify.com/v1/search?q=\(query)&type=playlist&limit=1"
        var request = URLRequest(url: URL(string: urlString)!)
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data,
               let result = try? JSONDecoder().decode(SearchResponse.self, from: data) {
                completion(result.playlists.items)
            } else {
                completion([])
            }
        }.resume()
    }

    struct SearchResponse: Decodable {
        let playlists: Playlists
    }

    struct Playlists: Decodable {
        let items: [SpotifyPlaylist]
    }

    struct SpotifyPlaylist: Decodable {
        let name: String
        let external_urls: [String: String]
    }

}
