//
//  VibrationHelper.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    func impact() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
