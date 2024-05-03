//
//  BonusGameView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct BonusGameView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var degrees: Double = 0
    @State private var isPresent = false
    
    var body: some View {
        ZStack{
            Color(.backGround)
                .ignoresSafeArea()
            VStack {
                Text("BONUS GAME")
                    .foregroundStyle(.white)
                    .font(.system(size: 41,weight: .bold))
                    .padding(.top, 30)
                    .minimumScaleFactor(0.8)
                Spacer()
                ZStack {
                    Image(.whels)
                        .resizable()
                        .frame(width: 380, height: 380)
                    Image(.arow)
                        .resizable()
                        .frame(width: 70, height: 56)
                        .padding(.leading, -20)
                        .rotationEffect(Angle(degrees: 68))
                        .rotationEffect(Angle(degrees: viewModel.degrees), anchor: .center)
                    if viewModel.store[0].spin < 1 {
                        TimerSpinView()
                    }
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 108, height: 43)
                        .foregroundStyle(.backGroundButtton)
                    
                    Text("SPIN: \(viewModel.store[0].spin)")
                        .foregroundStyle(.white)
                        .padding()
                }
                
                Spacer()
                
                //MARK: - Spin Button
                if viewModel.store[0].spin > 0 {
                    StartButton(action: {
                        viewModel.findBonus()
                        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { Timer in
                            isPresent = true
                            viewModel.store[0].spin -= 1
                            viewModel.saveDate()
                        }
                    }, text: "SPIN",cornerRadius: 48.0)
                    .padding(.bottom, 40)
                    .shadow(color: .blue, radius: 21)
                } else {
                    StartButton(action: {
                        viewModel.buySpin()
                    }, text: "100",cornerRadius: 48.0, money: true)
                    .padding(.bottom, 40)
                    .shadow(color: .blue, radius: 21)
                }
            }.padding()
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            YourPrizeView(viewModel: viewModel)
        })
        .animation(.easeInOut(duration: 2), value: viewModel.degrees)
        
        //MARK: - ToolBar
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading){
                ToolBarMoneyView(money: Int(viewModel.store[0].money)).padding(.leading, 40)
            }
            ToolbarItem {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.white)
                }
            }
        })
        
    }
}

#Preview {
    BonusGameView(viewModel: ViewModel())
}
