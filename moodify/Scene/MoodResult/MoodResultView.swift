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
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            // Playlist resmi
                            AsyncImage(url: URL(string: playlist.imageUrl)) { image in
                                image.resizable()
                                     .scaledToFill()
                                     .frame(width: 50, height: 50)
                                     .cornerRadius(8)
                            } placeholder: {
                                Color.gray.opacity(0.2).frame(width: 50, height: 50).cornerRadius(8)
                            }
                            
                            // Playlist adı ve sanatçı ismi
                            VStack(alignment: .leading) {
                                Text(playlist.name)
                                    .font(.headline)
                                Text(playlist.artistName) // Sanatçı ismi
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            // Spotify'da Aç butonu
                            Link("Open in Spotify", destination: URL(string: playlist.uri)!)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(radius: 5)
                    .padding(.vertical, 5)
                }
            }
        }
        .onAppear {
            viewModel.fetchPlaylist()
        }
        .navigationBarTitle("Mood Result", displayMode: .inline)
        .tint(Color.pink)
    }
}

#Preview {
    MoodResultView(viewModel: MoodResultViewModel(mood: "test"))
        .environmentObject(MoodResultViewModel(mood: "test"))
}

