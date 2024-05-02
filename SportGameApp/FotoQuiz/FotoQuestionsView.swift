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
                
                FotoQuizCellView(viewModel: viewModel, fotoQuiz: viewModel.fotoQuiz[viewModel.questionIndex])
                
                Spacer()
                //MARK: - Botton bar
                HStack(spacing: 20){
                    Spacer()
                    PassIconView(image: Image(.lighting), number: 0)
                    
                    PassIconView(image: Image(.pacmen), number: 0)
                    Spacer()
                    StartButton(action: {
                        print(viewModel.questionIndex + 1)
                        if viewModel.questionIndex + 1 == viewModel.fotoQuiz.count{
                            viewModel.fotoQuizVictory()
                        }else {
                            viewModel.questionIndex += 1
                        }
                    }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                }.padding(.horizontal, 30)
                
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
    }
}

#Preview {
    FotoQuestionsView(viewModel: ViewModel())
}
