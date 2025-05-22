//
//  WinGameView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 21.05.2025.
//

import SwiftUI

struct WinGameView: View {
    
    @ObservedObject var gameManager = GameManager()
    var dismiss: () -> Void
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                ZStack {
                    
                    Image("BG_3_Parallax")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    ZStack() {
                        Image("Frame_1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.85)
                        VStack {
                            Text("MOVIES: \(gameManager.moves)")
                            Text("TIME: \(gameManager.timeString)")
                        }
                        .font(.title2).bold()
                        .foregroundColor(.white)
                        .padding(.top, 55)
                        
                    }
                    .position(
                        x: geometry.size.width/2,
                        y: geometry.size.height/2 + 150
                    )
                    
                    Image("youwin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 1)
                        .position(
                            x: geometry.size.width/2,
                            y: geometry.size.height/2
                        )
                    
                    HStack {
                        
                        Button(action: {
                            gameManager.restart()
                        }) {
                            Image("Undo")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .padding()
                        }
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Image("Menu")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .padding()
                        }
                    }
                    .position(
                        x: geometry.size.width/2,
                        y: geometry.size.height/2 + 300
                    )
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}


#Preview {
    WinGameView(dismiss: {})
}
