//
//  SplashView.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 18.04.2025.
//

import SwiftUI

struct SplashView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 380, height: 300)
            ProgressView()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isActive = true
            }
        }
    }
}

