//
//  MenuView.swift
//  SportGameApp
//
//  Created by Роман on 24.04.2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(.backGround)
            Image(.ball)
                .resizable()
                .frame(width: 347, height: 393)
                .padding(.top, 345)
                .padding(.leading,197)
            VStack {
                Text("MENU")
                    .foregroundStyle(.white)
                    .font(.system(size: 41))
                    .bold()
                    .padding(.top, 160)
                ButtonMenu(text: "GAMES", icon: "gamecontroller.fill")
                    .padding(.top, 40)
                ButtonMenu(text: "BONUS GAME", icon: "star.fill")
                ButtonMenu(text: "SHOP", icon: "cart.fill")
                Spacer()
                ButtonMenu(text: "SETTINGS", icon: "gear")
                    .padding(.bottom, 55)
                
            }
            
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    MenuView()
}
