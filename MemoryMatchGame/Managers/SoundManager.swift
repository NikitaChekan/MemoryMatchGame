//
//  SoundManager.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import AVFoundation

class SoundManager {
    
    static let shared = SoundManager()
    
    private var player: AVAudioPlayer?
    private var isSoundEnabled = true
    
    func playSound(named name: String) {
        guard isSoundEnabled else { return }
        
        guard let url = Bundle.main.url(forResource: name, withExtension: nil) else { return }
        do {
            player?.stop()
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error sound: \(error.localizedDescription)")
        }
    }
    
    func toggleSound() {
        isSoundEnabled.toggle()
    }
    
    func resetToEnabled() {
        isSoundEnabled = true
    }
    
}
