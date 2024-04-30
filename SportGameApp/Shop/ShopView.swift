//
//  ShopView.swift
//  SportGameApp
//
//  Created by Роман on 29.04.2024.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        ZStack {
            Color.backGround
                .ignoresSafeArea()
            VStack{
                Text("SHOP")
                    .foregroundStyle(.white)
                    .font(.system(size: 41))
                    .bold()
                Spacer()
                //MARK: - add Pacman
                HStack{
                    ZStack {
                        Image(.pacmen)
                            .resizable()
                            .frame(width: 66, height: 66)
                        ZStack{
                            RoundedRectangle(cornerRadius: 46)
                                .foregroundStyle(.colorButton)
                            HStack {
                                Image(.money)
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Text("100")
                                    .bold()
                            }.foregroundStyle(.white)
                        }
                        .offset(x: 43, y: -30)
                        .frame(width: 67, height: 30)
                    }
                    Spacer()
                    Text("Delete one object")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.priceBasket += 100
                        viewModel.simplePacmen += 1
                    }, label: {
                        ZStack{
                            Circle()
                                .foregroundStyle(.backGroundButtton)
                                .frame(width: 43)
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    })
                    
                }
                //MARK: - add Lighting
                HStack{
                    ZStack {
                        Image(.lighting)
                            .resizable()
                            .frame(width: 66, height: 66)
                        ZStack{
                            RoundedRectangle(cornerRadius: 46)
                                .foregroundStyle(.colorButton)
                            HStack {
                                Image(.money)
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                Text("150")
                                    .bold()
                            }.foregroundStyle(.white)
                        }
                        .offset(x: 43, y: -30)
                        .frame(width: 67, height: 30)
                    }
                    Spacer()
                    Text("Delete two object")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.priceBasket += 150
                        viewModel.simpleLighting += 1
                    }, label: {
                        ZStack{
                            Circle()
                                .foregroundStyle(.backGroundButtton)
                                .frame(width: 43)
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                    })
                    
                }
                Spacer()
                Divider()
                    .background {
                        Color.gray
                    }
                    .padding(.bottom, 20)
                //MARK: - Basket
                HStack(spacing: 30){
                    Image(systemName: "cart.fill")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 29, height: 29)
                    PassIconView(image: Image(.pacmen), number: viewModel.simplePacmen)
                    PassIconView(image: Image(.lighting), number: viewModel.simpleLighting)
                }.padding(.bottom, 20)
                
                //MARK: - Button BUY
                Button(action: {viewModel.buy()}, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(.colorButton)
                            .frame(width: 331, height: 80)
                        HStack(spacing: 20) {
                            Text("BUY")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .bold()
                            Image(.money)
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 26, height: 26)
                            Text("\(viewModel.priceBasket)")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .bold()
                        }
                    }
                })
                
            }.padding()
        }.toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                ToolBarMoneyView(money: Int(viewModel.store[0].money))
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    //destenation
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 27,height: 27)
                        .foregroundStyle(.white)
                }
                
            }
        })
    }
}

#Preview {
    ShopView(viewModel: ViewModel())
}
