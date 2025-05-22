//
//  VibrationHelper.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import UIKit

class VibrationManager {
    
    static let shared = VibrationManager()
    private var isVibrationEnabled = true
    
    func impact() {
        guard isVibrationEnabled else { return }
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func success() {
        guard isVibrationEnabled else { return }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func toggleVibration() {
        isVibrationEnabled.toggle()
    }
    
    func resetToEnabled() {
        isVibrationEnabled = true
    }
    
}
