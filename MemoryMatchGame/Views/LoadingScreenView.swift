//
//  ContentView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 19.05.2025.
//

import SwiftUI

struct LoadingScreenView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                Image("BG_1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                Image("BG_3_Parallax")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                
                LoadingAnimationView()
                
            }
            .ignoresSafeArea()
            
            Text("Loading...")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    LoadingScreenView()
}
