//
//  MenuView.swift
//  SportGameApp
//
//  Created by Роман on 24.04.2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
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
                    NavigationLink {
                        GamesView()
                    } label: {
                        ButtonMenu(text: "GAMES", icon: "gamecontroller.fill")
                    }
                        .padding(.top, 40)
                    NavigationLink {
                        BonusGameView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundStyle(.colorButton)
                                .frame(width: 331, height: 80)
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.white)
                                Text("BONUS GAME")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .bold()
                            }
                        }
                    }
                    
                    ButtonMenu(text: "SHOP", icon: "cart.fill")
                    
                    Spacer()
                    
                    ButtonMenu(text: "SETTINGS", icon: "gear")
                        .padding(.bottom, 55)
                    
                }
                
                
            }.ignoresSafeArea()
        }
        
    }
}

#Preview {
    MenuView()
}
