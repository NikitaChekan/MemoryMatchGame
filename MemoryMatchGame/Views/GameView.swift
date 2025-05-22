//
//  GameView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 20.05.2025.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    @ObservedObject var gameManager = GameManager()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("BG_2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .ignoresSafeArea()
            
            ZStack {
                VStack {
                    SettingsButtonView()
                    MeterPanelView(gameManager: gameManager)
                    GameBoardView(gameManager: gameManager)
                        .scaledToFit()
                        .allowsHitTesting(!gameManager.isPaused)
                    BottomButtonsView(gameManager: gameManager, dismiss: { dismiss() })
                        .padding(.top, 50)
                }
                .offset(y: 20)
            }

            if gameManager.isWin {
                Color.black.opacity(0.9)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
                WinGameView(gameManager: gameManager, dismiss: { dismiss() })
            }
            
            //Проверка экрана WINVIEW
//            Button("WIN") {
//                gameManager.isWin = true
//            }
            
        }
        .onDisappear {
            gameManager.restart()
            SoundManager.shared.resetToEnabled()
            VibrationManager.shared.resetToEnabled()
        }
        .animation(.easeInOut, value: gameManager.isWin)
    }
}

#Preview {
    GameView()
}
