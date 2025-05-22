//
//  NotificationsView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 22.05.2025.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geometry in
                    
                    Image("BG_1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                        .overlay() {
                            Color.black.opacity(0.8)
                                .ignoresSafeArea()
                        }
                    
                    Image("Menu_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .position(
                            x: UIScreen.main.bounds.width / 2,
                            y: UIScreen.main.bounds.height / 2 - 100
                        )
                        .foregroundColor(.black)
                }
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack(spacing: 20) {
                        
                        Text("ALLOW NOTIFICATIONS ABOUT BONUSES AND PROMOS")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text("Stay tuned with best offers from our casino")
                            .font(.title3.bold())
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        dismiss()
                    }) {
                        Text("Yes, I Want Bonuses!")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .font(.headline.weight(.bold))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 12)
                    
                    Button("Skip") {
                        dismiss()
                    }
                    .font(.headline)
                    .foregroundColor(.gray)
                }
                .padding(.bottom, 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

#Preview {
    NotificationsView()
}
