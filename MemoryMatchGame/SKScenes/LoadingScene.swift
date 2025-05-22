//
//  LoadingScene.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 19.05.2025.
//

import SpriteKit

class LoadingScene: SKScene {
    private var indicator: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        
        indicator = SKSpriteNode(imageNamed: "fire")
        
        let scale: CGFloat = 0.3
        indicator.setScale(scale)
        
        let scaledHeight = size.height * scale
        
        indicator.position = CGPoint(
            x: size.width / 2,
            y: size.height - scaledHeight
        )
        addChild(indicator)
        
        let moveUp = SKAction.moveBy(x: 0, y: 30, duration: 1)
        let moveDown = SKAction.moveBy(x: 0, y: -30, duration: 1)
        let pulse = SKAction.sequence([moveUp, moveDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        indicator.run(repeatPulse)
    }
}
