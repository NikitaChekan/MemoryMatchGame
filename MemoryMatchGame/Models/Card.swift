//
//  Card.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import Foundation

struct Card: Identifiable, Equatable {
    let id: Int
    let imageName: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
}
