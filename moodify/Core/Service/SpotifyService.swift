//
//  SpotifyService.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 21.04.2025.
//

import Foundation

class SpotifyService {
    func getAccessToken(completion: @escaping (String?) -> Void) {
        let url = URL(string: "https://accounts.spotify.com/api/token")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let credentials = "\("6121fcac2d83487d840272805fa41182"):\("65fcc61079f84046b1681cc2e980872f")"
        let encoded = Data(credentials.utf8).base64EncodedString()
        
        request.addValue("Basic \(encoded)", forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let bodyString = "grant_type=client_credentials"
        request.httpBody = bodyString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data,
               let result = try? JSONDecoder().decode(AccessTokenResponse.self, from: data) {
                completion(result.access_token)
            } else {
                completion(nil)
            }
        }.resume()
    }

    struct AccessTokenResponse: Decodable {
        let access_token: String
        let token_type: String
        let expires_in: Int
    }

}
