//
//  MemoryMatchGameApp.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 19.05.2025.
//

import SwiftUI

@main
struct MemoryMatchGameApp: App {
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingScreenView()
                    .statusBar(hidden: true)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            } else {
                MainMenuView()
                    .statusBar(hidden: true)
            }
        }
    }
}
