//
//  GameManager.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import Foundation
import Combine

class GameManager: ObservableObject {
    
    @Published var cards: [Card] = []
    @Published var moves: Int = 0
    @Published var isWin: Bool = false
    @Published var timeString: String = "00:00"
    
    @Published var isPaused: Bool = false
    
    private var firstFlippedIndex: Int?
    private var timer: Timer?
    private var seconds: Int = 0
    
    let cardImages = ["slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"]
    
    init() {
        startGame()
    }
    
    func startGame() {
        isWin = false
        moves = 0
        seconds = 0
        timeString = "00:00"
        firstFlippedIndex = nil
        isPaused = false
        
        var deck = (cardImages + cardImages).enumerated().map { Card(id: $0.offset, imageName: $0.element) }
        deck.shuffle()
        cards = deck
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.seconds += 1
            self.timeString = String(format: "%02d:%02d", self.seconds / 60, self.seconds % 60)
        }
        
        startTimer()
    }
    
    func flipCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }),
              !cards[index].isFlipped,
              !cards[index].isMatched,
              !isWin else { return }
        
        cards[index].isFlipped = true
        
        SoundManager.shared.playSound(named: "flip.mp3")
        VibrationManager.shared.impact()
        
        if let firstIndex = firstFlippedIndex {
            moves += 1
            if cards[firstIndex].imageName == cards[index].imageName {
                cards[firstIndex].isMatched = true
                cards[index].isMatched = true
                
                SoundManager.shared.playSound(named: "match.mp3")
                VibrationManager.shared.success()
                
                checkWin()
                firstFlippedIndex = nil
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.cards[firstIndex].isFlipped = false
                    self.cards[index].isFlipped = false
                    self.firstFlippedIndex = nil
                }
            }
        } else {
            firstFlippedIndex = index
        }
    }
    
    func checkWin() {
        if cards.allSatisfy({ $0.isMatched }) {
            isWin = true
            timer?.invalidate()
            
            SoundManager.shared.playSound(named: "win.mp3")
            VibrationManager.shared.success()
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.seconds += 1
            self.timeString = String(format: "%02d:%02d", self.seconds / 60, self.seconds % 60)
        }
    }
    
    func pauseGame() {
        isPaused = true
        timer?.invalidate()
    }
    
    func resumeGame() {
        isPaused = false
        startTimer()
    }
    
    func restart() {
        startGame()
    }
    
    
}
