//
//  FotoQuestionsView.swift
//  SportGameApp
//
//  Created by Роман on 02.05.2024.
//

import SwiftUI

struct FotoQuestionsView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var gameOver = false
    @State var isPresent = false
    
    var body: some View {
        ZStack {
            Color(.backGround)
                .ignoresSafeArea()
            VStack{
                //MARK: - Questions Counter
                ZStack{
                    Color(.backGroundButtton)
                        .frame(width: 65, height: 31)
                        .cornerRadius(50)
                    Text("\(viewModel.questionIndex + 1) / \(viewModel.fotoQuiz.count)")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                }
                
                FotoQuizCellView(viewModel: viewModel)
                
                Spacer()
                //MARK: - Botton bar
                HStack(spacing: 20){
                    //MARK: - Lighting
                    Button(action: {
                        if viewModel.store[0].lighting > 0{
                            viewModel.deleteOneFoto()
                            viewModel.deleteOneFoto()
                            viewModel.store[0].lighting -= 1
                            viewModel.saveDate()
                        }
                    }, label: {
                        PassIconView(image: Image(.lighting), number: Int(viewModel.store[0].lighting))
                    }).disabled(viewModel.store[0].lighting > 0 ? false : true)
                    
                    //MARK: - Pacmen
                    Button(action: {
                        if viewModel.store[0].pacmen > 0{
                            viewModel.deleteOneFoto()
                            viewModel.store[0].pacmen -= 1
                            viewModel.saveDate()
                        }
                    }, label: {
                        PassIconView(image: Image(.pacmen), number: Int(viewModel.store[0].pacmen))
                    }).disabled(viewModel.store[0].pacmen > 0 ? false : true)
                    
                    
                    
                    Spacer()
                    //MARK: - Next question
                    StartButton(action: {
                        
                        if viewModel.questionIndex + 1 >= viewModel.fotoQuiz.count{
                            viewModel.fotoQuizVictory()
                            gameOver = true
                        }else {
                            viewModel.questionIndex += 1
                        }

                        viewModel.nextLevel()
                    }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                        .disabled(viewModel.choisOn ? false : true)
                }.padding(.horizontal)
                
            }.padding()
            if isPresent {
                InfoPassView()
                    .onTapGesture {
                        isPresent = false
                    }
            }
            if gameOver {
                WinnerView(viewModel: viewModel)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                ToolBarMoneyView(money: Int(viewModel.store[0].money))
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    isPresent = true
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: 27)
                            .foregroundStyle(.backGroundButtton)
                        Text("i").foregroundStyle(.white)
                    }
                })
            }
            
        })
    }
}

#Preview {
    FotoQuestionsView(viewModel: ViewModel())
}
