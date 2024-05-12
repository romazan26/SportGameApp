//
//  SettingsView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isOnSound = true
    @State var isOnMusic = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(.backGround)
                .ignoresSafeArea()
            VStack(spacing: 60) {
                Text("SETTINGS")
                    .font(.system(size: 32, weight: .bold))

                Toggle(isOn: $isOnSound) {
                    Text("Sound")
                        .font(.system(size: 24))
                }
                Toggle(isOn: $isOnMusic	) {
                    Text("Music")
                        .font(.system(size: 24))
                }
                Spacer()
                StartButton(action: {
                    //action
                }, text: "SAVE", cornerRadius: 24)
            }
            .padding()
            .foregroundStyle(.white)
            .navigationBarBackButtonTitleHidden()
            .toolbar(content: {
                ToolbarItem {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.white)
                }
            })
        }
    }
}

#Preview {
    NavigationView {
        SettingsView()
    }
}
