//
//  MainMenuView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 20.05.2025.
//

import SwiftUI

struct MainMenuView: View {
    
    @State private var showGameView = false
    @State private var showNotificationsView = false
    @State private var showPrivacyPolicy = false
    
    var body: some View {
        NavigationStack {
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
                    
                    Image("Menu_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)
                        .position(
                            x: UIScreen.main.bounds.width / 2,
                            y: UIScreen.main.bounds.height / 2 - 100
                        )
                }
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        showGameView = true
                    }) {
                        Image("Play_button-2")
                            .resizable()
                            .frame(width: 250, height: 65)
                    }
                    
                    Button(action: {
                        showNotificationsView = true
                    }) {
                        ZStack {
                            Image("Play_button-4")
                                .resizable()
                                .frame(width: 250, height: 65)
                            Text("NOTIFICATIONS")
                                .font(.title2).bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 50)
                    
                    Button(action: {
                        showPrivacyPolicy = true
                    }) {
                        Image("Play_button-3")
                            .resizable()
                            .frame(width: 200, height: 40)
                    }
                    
                    Spacer()
                }
                .offset(y: 180)
            }
            .navigationDestination(isPresented: $showGameView) {
                GameView()
                    .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $showNotificationsView) {
                NotificationsView()
                    .navigationBarBackButtonHidden(true)
            }
            .navigationDestination(isPresented: $showPrivacyPolicy) {
                SafariHelper(url: URL(string: "https://www.apple.com")!)
                    .ignoresSafeArea()
            }
        }
    }
}
#Preview {
    MainMenuView()
}
