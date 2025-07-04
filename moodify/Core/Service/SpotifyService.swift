//
//  SpotifyService.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 21.04.2025.
//

import Foundation

class SpotifyService {
    
    func getAccessToken(completion: @escaping (String?) -> Void) {
        guard
            let clientID = Bundle.main.infoDictionary?["SPOTIFY_CLIENT_ID"] as? String,
            let clientSecret = Bundle.main.infoDictionary?["SPOTIFY_CLIENT_SECRET"] as? String
        else {
            completion(nil)
            return
        }
        
        let url = URL(string: "https://accounts.spotify.com/api/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let credentials = "\(clientID):\(clientSecret)"
        let encoded = Data(credentials.utf8).base64EncodedString()
        
        request.addValue("Basic \(encoded)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyString = "grant_type=client_credentials"
        request.httpBody = bodyString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            if let result = try? JSONDecoder().decode(AccessTokenResponse.self, from: data) {
                completion(result.access_token)
            } else {
                completion(nil)
            }
        }.resume()
    }

    
    func fetchPlaylist(for mood: String, accessToken: String, completion: @escaping ([Playlist]) -> Void) {
        let urlString = "https://api.spotify.com/v1/search?q=\(mood.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&type=playlist"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                let playlists = searchResponse.playlists.items.compactMap { $0 }
                
                DispatchQueue.main.async {
                    completion(playlists)
                }
            } catch {
                completion([])
            }
        }.resume()
    }
    
    struct SearchResponse: Decodable {
        let playlists: PlaylistContainer
    }
    
    struct PlaylistContainer: Decodable {
        let items: [Playlist?]
    }
    
    struct Playlist: Identifiable, Decodable {
        let id: String
        let name: String
        let uri: String
        let images: [SpotifyImage]?

        struct SpotifyImage: Decodable {
            let url: String
        }
    }


    struct AccessTokenResponse: Decodable {
        let access_token: String
        let token_type: String
        let expires_in: Int
    }
}
