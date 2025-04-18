//
//  MoodService.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import Foundation

class MoodService {
    func fetchMood(for text: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://api.twinword.com/v6/sentiment-analysis") else {
            completion("Geçersiz API URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("caf3f5db5amsh20de9b951831287p123015jsnc06b1a992010", forHTTPHeaderField: "X-Twaip-Key")
        let body = [
            "text": text
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
            request.httpBody = jsonData
        } catch {
            print("JSON oluşturulurken hata")
            completion("Hata oluştu")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion("Hata oluştu")
                }
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let sentiment = jsonResponse["sentiment"] as? String {
                    DispatchQueue.main.async {
                        completion("Ruh Hali: \(sentiment)")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion("Veri işlenemedi")
                }
            }
        }
        task.resume()
    }
}

