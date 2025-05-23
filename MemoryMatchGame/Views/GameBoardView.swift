//
//  GameBoardView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SwiftUI
import SpriteKit

struct GameBoardView: UIViewRepresentable {
    
    @ObservedObject var gameManager = GameManager()
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        skView.isOpaque = false
        skView.backgroundColor = .clear
        
        let scene = GameScene(size: UIScreen.main.bounds.size)
        scene.scaleMode = .aspectFill
        
        scene.gameManager = gameManager
        
        skView.presentScene(scene)
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        if let scene = uiView.scene as? GameScene {
            scene.gameManager = gameManager
            scene.updateCardsState()
        }
    }
}
