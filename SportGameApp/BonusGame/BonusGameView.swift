//
//  BonusGameView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct BonusGameView: View {
    var body: some View {
        ZStack{
            Color(.backGround)
                .ignoresSafeArea()
            ZStack {
                Image(.whels)
                    .resizable()
                .frame(width: 430, height: 430)
                Image(.arow)
                    .resizable()
                    .frame(width: 70, height: 56)
                    .padding(.leading, -20)
            }
        }
    }
}

#Preview {
    BonusGameView()
}
