//
//  MoodService.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

class TextAnalysisService {
    func detectMood(text: String) async -> String {
        guard let url = URL(string: "https://language.googleapis.com/v1/documents:analyzeSentiment?key=AIzaSyD6Ht3nU8EOlByvd7zuZt0TwuTDk6GEs1c") else {
            return "URL hatalı"
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "document": [
                "type": "PLAIN_TEXT",
                "language": "en",
                "content": text
            ],
            "encodingType": "UTF8"
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData

            let (data, _) = try await URLSession.shared.data(for: request)

            if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let sentiment = json["documentSentiment"] as? [String: Any],
               let score = sentiment["score"] as? Double {
                
                print("Google Cloud Score: \(score)")
                
                let closestMood = moodModel.min(by: {
                    abs($0.value - score) < abs($1.value - score)
                })?.name ?? "Unknown"
                
                print(closestMood)
                return closestMood
                
            } else {
                return "Cannnot parse JSON"
            }
        } catch {
            print("Error: \(error)")
            return "Request failed"
        }
    }
    
}

