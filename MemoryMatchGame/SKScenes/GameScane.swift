//
//  GameScane.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SpriteKit

class GameScene: SKScene {
    
    weak var gameManager: GameManager?
    var cardNodes: [Int: SKSpriteNode] = [:]
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        setupCards()
    }
    
    func setupCards() {
        removeAllChildren()
        cardNodes = [:]
        guard let cards = gameManager?.cards else { return }
        
        let gridSize = 4
        let cardSize = CGSize(width: 80, height: 80)
        let spacing: CGFloat = 10
        let startX = (size.width - (CGFloat(gridSize) * cardSize.width + CGFloat(gridSize - 1) * spacing)) / 2
        let startY = (size.height - (CGFloat(gridSize) * cardSize.height + CGFloat(gridSize - 1) * spacing)) / 2
        
        for i in 0..<cards.count {
            let card = cards[i]
            let row = i / gridSize
            let col = i % gridSize
            let x = startX + CGFloat(col) * (cardSize.width + spacing) + cardSize.width / 2
            let y = size.height - (startY + CGFloat(row) * (cardSize.height + spacing) + cardSize.height / 2)
            
            let imageName = card.isFlipped || card.isMatched ? card.imageName : "slot_back"
            let cardNode = SKSpriteNode(imageNamed: imageName)
            cardNode.size = cardSize
            cardNode.position = CGPoint(x: x, y: y)
            cardNode.name = "\(card.id)"
            addChild(cardNode)
            cardNodes[card.id] = cardNode
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let gameManager = gameManager else { return }
        let location = touch.location(in: self)
        let nodes = nodes(at: location)
        
        for node in nodes {
            if let name = node.name, let id = Int(name),
               let card = gameManager.cards.first(where: { $0.id == id }),
               let cardNode = cardNodes[id],
               !card.isFlipped, !card.isMatched, !gameManager.isWin {
                
                flipCardAnimation(node: cardNode, toImageNamed: card.imageName) {
                    gameManager.flipCard(card)
                }
                break
            }
        }
    }
    
    func flipCardAnimation(node: SKSpriteNode, toImageNamed imageName: String, completion: (() -> Void)? = nil) {
        let firstFlip = SKAction.scaleX(to: 0.0, duration: 0.25)
        let changeTexture = SKAction.run {
            node.texture = SKTexture(imageNamed: imageName)
        }
        let secondFlip = SKAction.scaleX(to: 1.0, duration: 0.25)
        let sequence = SKAction.sequence([firstFlip, changeTexture, secondFlip])
        node.run(sequence, completion: {
            completion?()
        })
    }
    
    func updateCardsState() {
        guard let cards = gameManager?.cards else { return }
        
        for card in cards {
            guard let cardNode = cardNodes[card.id] else { continue }
            let shouldBeFace = card.isFlipped || card.isMatched
            let imageName = shouldBeFace ? card.imageName : "slot_back"
            cardNode.texture = SKTexture(imageNamed: imageName)
        }
    }
}
