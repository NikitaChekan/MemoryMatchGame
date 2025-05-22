//
//  LoadingAnimationView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 19.05.2025.
//

import SwiftUI
import SpriteKit

struct LoadingAnimationView: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        skView.isOpaque = false
        skView.backgroundColor = .clear
        
        let scene = LoadingScene(size: UIScreen.main.bounds.size)
        
        skView.presentScene(scene)
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        return
    }
}
