//
//  GamesView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color(.backGround)
                .ignoresSafeArea()
            Image(.ball)
                .resizable()
                .frame(width: 347, height: 393)
                .padding(.top, 345)
                .padding(.leading,197)
            VStack{
                Text("GAMES")
                    .foregroundStyle(.white)
                    .font(.system(size: 41))
                    .bold()
                    .padding(.top, 160)
                ButtonMenu(text: "QUIZ")
                    .padding(.top, 40)
                ButtonMenu(text: "PHOTO GUESS")
                ButtonMenu(text: "TRUE/FALSE")
                Spacer()
                StartButton(action: {
                    //action
                }, text: "BONUS GAME", image: "star.fill")
            }.foregroundStyle(.white)
        }
        .ignoresSafeArea()
        .toolbar(content: {
            ToolbarItem {
                Image(systemName: "gear")
            }
        })
        
    }
}

#Preview {
    GamesView()
}
