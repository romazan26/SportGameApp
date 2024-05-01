//
//  YourPrizeView.swift
//  SportGameApp
//
//  Created by Роман on 26.04.2024.
//

import SwiftUI

struct YourPrizeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(.backGround)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("YOUR PRIZE")
                    .foregroundStyle(.white)
                    .font(.system(size: 41,weight: .bold))
                   
                    .padding(.top, 30)
                    .minimumScaleFactor(0.8)
                ZStack {
                    Image(.prizeBackground)
                        .resizable()
                        .opacity(0.8)
                        .shadow(color: .backGround, radius: 10)
                       // .frame(width: 400, height: 400)
                    Circle()
                        .stroke(lineWidth: 40)
                        .foregroundStyle(.backGround)
                        .opacity(0.7)
                        .shadow(color: .backGround, radius: 70)
                        
                        
                }.frame(width: 428, height: 428)
                Text("Spins left: 0")
                    .foregroundStyle(.white)
                    .font(.caption)
                StartButton(action: {
                    dismiss()
                }, text: "COLLECT")
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    YourPrizeView()
}
