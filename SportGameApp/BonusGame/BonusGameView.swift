//
//  BonusGameView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct BonusGameView: View {
    @State private var degrees: Double = 0
    @State private var isPresent = false
    var body: some View {
        ZStack{
            Color(.backGround)
                .ignoresSafeArea()
            VStack {
                Text("BONUS GAME")
                    .foregroundStyle(.white)
                    .font(.system(size: 41))
                    .bold()
                    .padding(.top, 30)
                    .minimumScaleFactor(0.8)
                Spacer()
                ZStack {
                    Image(.whels)
                        .resizable()
                        .frame(width: 400, height: 400)
                    Image(.arow)
                        .resizable()
                        .frame(width: 70, height: 56)
                        .padding(.leading, -20)
                        .rotationEffect(Angle(degrees: degrees), anchor: .center)
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 108, height: 43)
                        .foregroundStyle(.backGroundButtton)
                    
                    Text("SPIN: 1")
                        .foregroundStyle(.white)
                        .padding()
                }
                
                Spacer()
                
                //MARK: - Spin Button
                StartButton(action: {
                    degrees = 0
                    degrees = Double.random(in: 1...1440)
                    isPresent = true
                }, text: "SPIN",cornerRadius: 48.0)
                    .padding(.bottom, 40)
                    .shadow(color: .blue, radius: 21)
            }.padding()
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            YourPrizeView()
        })
        .animation(.easeInOut(duration: 2), value: degrees)
        
        //MARK: - ToolBar
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading){
                ToolBarMoneyView().padding(.leading, 40)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 27,height: 27)
                    .foregroundStyle(.white)
            }
        })
        
    }
}

#Preview {
    BonusGameView()
}
