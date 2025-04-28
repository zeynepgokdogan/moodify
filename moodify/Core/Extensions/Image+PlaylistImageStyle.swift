//
//  View+PlaylistImageStyle.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 28.04.2025.
//

import SwiftUI

extension Image {
    func playlistImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
            .foregroundColor(.gray)
    }
}
