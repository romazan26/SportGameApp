//
//  YourPrizeView.swift
//  SportGameApp
//
//  Created by Роман on 26.04.2024.
//

import SwiftUI

struct YourPrizeView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var showTimer: Bool
    
    var body: some View {
        ZStack {
            Color(.backGround)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("YOUR PRIZE")
                    .foregroundStyle(.white)
                    .font(.system(size: 41,weight: .bold))
                    .padding(.top, 50)
                    .minimumScaleFactor(0.8)
                ZStack {
                    Image(.prizeBackground)
                        .resizable()
                        .opacity(0.8)
                        .shadow(color: .backGround, radius: 10)
                        .frame(width: 350, height: 350)
                    Circle()
                        .stroke(lineWidth: 40)
                        .foregroundStyle(.backGround)
                        .opacity(0.7)
                        .shadow(color: .backGround, radius: 70)
                    viewModel.bonus
                        
                        
                }.frame(width: 428, height: 428)
                Text("Spins left: 0")
                    .foregroundStyle(.white)
                    .font(.caption)
                StartButton(action: {
                    viewModel.degrees = 0
                    viewModel.collctBonus()
                    dismiss()
                    if viewModel.store[0].spin <= 0 {
                        showTimer = true
                    } else {
                        showTimer = false
                    }
                }, text: "COLLECT")
                .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    YourPrizeView(viewModel: ViewModel(), showTimer: .constant(false))
}
