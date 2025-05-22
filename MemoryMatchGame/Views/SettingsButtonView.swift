//
//  SettingsButtonView.swift
//  MemoryMatchGame
//
//  Created by jopootrivatel on 22.05.2025.
//

import SwiftUI

struct SettingsButtonView: View {
    
    @State private var showSettingsOptions = false
    @State private var showVolumeOptions = false
    @State private var showVibrationOptions = false
    
    var body: some View {
        HStack {
            Button(action: {
                //                SoundManager.shared.playSound(named: "flip.mp3")
                //                VibrationManager.shared.impact()
                withAnimation(.spring()) {
                    showSettingsOptions.toggle()
                }
            }) {
                Image("Settings")
                    .resizable()
                    .frame(width: 65, height: 65)
                    .padding()
            }
            
            Spacer()
            
            if showSettingsOptions {
                HStack() {
                    Button(action: {
                        showVolumeOptions.toggle()
                        SoundManager.shared.toggleSound()
                    }) {
                        Image(showVolumeOptions ? "Mute_Sound" : "Speaker")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(1)
                    }
                    
                    Button(action: {
                        showVibrationOptions.toggle()
                        VibrationManager.shared.toggleVibration()
                    }) {
                        Image(showVibrationOptions ? "NoVibro" : "Vibro")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                }
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }
}

#Preview {
    SettingsButtonView()
}
