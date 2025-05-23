//
//  GameScane.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SpriteKit
import Combine

class GameScene: SKScene {
    
    weak var gameManager: GameManager?
    var cardNodes: [SKSpriteNode] = []
    
    private var previousCards: [Card] = []
    private var cancellables = Set<AnyCancellable>()
    
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        setupCards()
        subscribeToCardChanges()
    }
    
    func setupCards() {
        removeAllChildren()
        cardNodes = []
        guard let cards = gameManager?.cards else { return }
        
        let gridSize = 4
        let cardSize = CGSize(width: 80, height: 80)
        let spacing: CGFloat = 10
        let startX = (size.width - (CGFloat(gridSize) * cardSize.width + CGFloat(gridSize - 1) * spacing)) / 2
        let startY = (size.height - (CGFloat(gridSize) * cardSize.height + CGFloat(gridSize - 1) * spacing)) / 2
        
        for i in 0..<cards.count {
            let row = i / gridSize
            let col = i % gridSize
            let x = startX + CGFloat(col) * (cardSize.width + spacing) + cardSize.width / 2
            let y = size.height - (startY + CGFloat(row) * (cardSize.height + spacing) + cardSize.height / 2)
            
            let cardNode = SKSpriteNode(imageNamed: cards[i].isFlipped || cards[i].isMatched ? cards[i].imageName : "slot_back")
            cardNode.size = cardSize
            cardNode.position = CGPoint(x: x, y: y)
            cardNode.name = "\(cards[i].id)"
            addChild(cardNode)
            cardNodes.append(cardNode)
        }
        
        previousCards = cards
    }
    
    func animateFlip(for card: Card) {
        guard let node = cardNodes.first(where: { $0.name == "\(card.id)" }) else { return }
        
        let textureName = card.isFlipped || card.isMatched ? card.imageName : "slot_back"
        
        let flipAction = SKAction.scaleX(to: 0, duration: 0.3)
        let changeTexture = SKAction.run {
            node.texture = SKTexture(imageNamed: textureName)
        }
        let unflipAction = SKAction.scaleX(to: 1, duration: 0.3)
        let sequence = SKAction.sequence([flipAction, changeTexture, unflipAction])
        node.run(sequence)
    }
    
    func cardUpdates(_ cards: [Card]) {
        for card in cards {
            if let previousCard = previousCards.first(where: { $0.id == card.id }),
               previousCard.isFlipped != card.isFlipped {
                animateFlip(for: card)
            }
        }
        previousCards = cards
    }
    
    func subscribeToCardChanges() {
        guard let gameManager = gameManager else { return }
        gameManager.$cards.sink { [weak self] cards in
            self?.cardUpdates(cards)
        }.store(in: &cancellables)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let gameManager = gameManager else { return }
        
        let location = touch.location(in: self)
        let nodes = nodes(at: location)
        
        for node in nodes {
            if let name = node.name, let id = Int(name),
               let card = gameManager.cards.first(where: { $0.id == id }) {
                gameManager.flipCard(card)
                break
            }
        }
    }
    
}
