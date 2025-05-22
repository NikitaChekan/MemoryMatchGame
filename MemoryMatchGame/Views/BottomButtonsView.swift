//
//  BottomButtonsView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SwiftUI

struct BottomButtonsView: View {
    
    @ObservedObject var gameManager = GameManager()
    var dismiss: () -> Void
    
    var body: some View {
        HStack {
            
            Button(action: {
                if gameManager.isPaused {
                    gameManager.resumeGame()
                } else {
                    gameManager.pauseGame()
                }
            }) {
                Image(gameManager.isPaused ? "Play" : "Pause")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Image("Left")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .padding()
            }
            
            Spacer()
            
            Button(action: {
                gameManager.restart()
            }) {
                Image("Undo")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .padding()
            }
        }
    }
}

#Preview {
    BottomButtonsView(dismiss: {})
}
