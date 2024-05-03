//
//  TruFalseGameAnswerView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct TrueFalseGameAnswerView: View {
    
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
                    VStack {
                        Text("\(viewModel.questionIndex + 1) / \(viewModel.trueFalseGame.count)")
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                    }
                }
                
                TrueFalseCellView(viewModel: viewModel)
                
                Spacer()
                //MARK: - Botton bar
                HStack(spacing: 20){
                   
                    Button(action: {
                        viewModel.deleteOneTF()
                    }, label: {
                        PassIconView(image: Image(.pacmen), number: Int(viewModel.store[0].pacmen))
                    })
                    
                    
                    Spacer()
                    StartButton(action: {
                        
                        if viewModel.questionIndex + 1 >= viewModel.fotoQuiz.count{
                            viewModel.fotoQuizVictory()
                            gameOver = true
                        }else {
                            viewModel.questionIndex += 1
                            viewModel.choisOn = false
                        }
                        viewModel.nextLevel()
                    }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                }
                .padding(.vertical)
                .padding(.horizontal, 35)
            }
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
    TrueFalseGameAnswerView(viewModel: ViewModel())
}
