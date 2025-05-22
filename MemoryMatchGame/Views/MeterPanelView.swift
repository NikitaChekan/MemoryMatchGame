//
//  MeterPanelView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SwiftUI

struct MeterPanelView: View {
    
    @ObservedObject var gameManager = GameManager()
    
    var body: some View {
        ZStack {
            Image("meterPanel")
                .resizable()
                .scaledToFill()
                .padding(5)
                .frame(maxWidth: .infinity, maxHeight: 30)
                .clipped()
            
            HStack {
                Text("MOVIES: \(gameManager.moves)")
                Spacer()
                Text("TIME: \(gameManager.timeString)")
            }
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal, 65)
        }
    }
}

#Preview {
    MeterPanelView()
}
