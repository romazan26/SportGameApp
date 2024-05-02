//
//  WinnerView.swift
//  SportGameApp
//
//  Created by Роман on 01.05.2024.
//

import SwiftUI

struct WinnerView: View {
    
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .center) {
            BlurUIView(style: .systemChromeMaterialDark)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("\(viewModel.goodAnswer)/10")
                    .font(.system(size: 27,weight: .bold))
                Text(viewModel.win ? "YOU WIN" : "YOU LOSE")
                    .font(.system(size: 35,weight: .bold))
                ZStack{
                    RoundedRectangle(cornerRadius: 13.0)
                        .foregroundStyle(.greenApp)
                    HStack {
                        Image(.money)
                            .resizable()
                            .frame(width: 34, height: 34)
                        Text(viewModel.win ? "50" : "0")
                            .font(.system(size: 34,weight: .bold))
                    }
                }.frame(width: 165, height:  63)
                Spacer()
                StartButton(action: {
                    viewModel.win(money: viewModel.win ? 50 : 10)
                    dismiss()
                }, text: viewModel.win ? "NEXT LEVEL" : "10", money: viewModel.win ? false : true)
                
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    WinnerView(viewModel: ViewModel())
}
