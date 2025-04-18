//
//  moodifyApp.swift
//  moodify
//
//  Created by Zeynep Gökdoğan on 14.04.2025.
//

import SwiftUI

@main
struct moodifyApp: App {
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
                    .preferredColorScheme(.dark)
            } else{
                SplashView(isActive: $isActive)
                    .preferredColorScheme(.dark)
                
            }
        }
    }
}
