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
    @State var showTimer = false
    
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
                    
                    //MARK: - Timer
                    if showTimer{
                        TimerSpinView(viewModel: viewModel)
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
                            
                        }
                    }, text: "SPIN",cornerRadius: 48.0)
                    .padding(.bottom, 40)
                    .shadow(color: .blue, radius: 21)
                } else {
                    StartButton(action: {
                        viewModel.buySpin()
                        if viewModel.store[0].spin <= 0 {
                            showTimer = true
                        }else {
                            showTimer = false
                        }
                    }, text: "100",cornerRadius: 48.0, money: true)
                    .padding(.bottom, 40)
                    .shadow(color: .blue, radius: 21)
                }
            }.padding()
        }
        .onAppear(perform: {
            if viewModel.store[0].spin <= 0 {
                showTimer = true
            }
        })
        .fullScreenCover(isPresented: $isPresent, content: {
            YourPrizeView(viewModel: viewModel, showTimer: $showTimer)
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
