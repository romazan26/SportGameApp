//
//  QuizQuestionsView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct QuizQuestionsView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var isPresent = false
    @State var gameOver = false
    
    var body: some View {
        ZStack {
            Color(.backGround)
                .ignoresSafeArea()
                VStack {
                    //MARK: - Questions Counter
                    ZStack{
                        Color(.backGroundButtton)
                            .frame(width: 65, height: 31)
                            .cornerRadius(50)
                        Text("\(viewModel.questionIndex + 1) / \(viewModel.quiz.count)")
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                    }
                    
                    //MARK: - Question
                    ZStack{
                        Color(.backGroundButtton)
                            .frame(width: 331, height: 104)
                            .cornerRadius(50)
                        Text(viewModel.quiz[viewModel.questionIndex].title)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                    }
                    //MARK: - Answers
                    
                    ScrollView {
                        VStack(spacing: 15) {
                            ButtonAnswerView( question: viewModel.quiz[viewModel.questionIndex].answer[0],
                                                  color: viewModel.color1)
                                    .onTapGesture {
                                        if !viewModel.choisOn{
                                            if viewModel.quiz[viewModel.questionIndex].answer[0].isTrue{
                                                viewModel.goodAnswer += 1
                                            }
                                            viewModel.checkColor()
                                            viewModel.color1 = viewModel.color
                                            viewModel.color2 = false
                                            viewModel.color3 = false
                                            viewModel.color4 = false
                                        }
                                    }
                            ButtonAnswerView( question: viewModel.quiz[viewModel.questionIndex].answer[1],
                                                  color: viewModel.color2)
                                    .onTapGesture {
                                        if !viewModel.choisOn{
                                            if viewModel.quiz[viewModel.questionIndex].answer[1].isTrue{
                                                viewModel.goodAnswer += 1
                                            }
                                            viewModel.checkColor()
                                            viewModel.color2 = viewModel.color
                                            viewModel.color1 = false
                                            viewModel.color3 = false
                                            viewModel.color4 = false
                                        }
                                    }
                            ButtonAnswerView( question: viewModel.quiz[viewModel.questionIndex].answer[2],
                                                  color: viewModel.color3)
                                    .onTapGesture {
                                        if !viewModel.choisOn{
                                            if viewModel.quiz[viewModel.questionIndex].answer[2].isTrue{
                                                viewModel.goodAnswer += 1
                                            }
                                            viewModel.checkColor()
                                            viewModel.color3 = viewModel.color
                                            viewModel.color2 = false
                                            viewModel.color1 = false
                                            viewModel.color4 = false
                                        }
                                    }
                            ButtonAnswerView( question: viewModel.quiz[viewModel.questionIndex].answer[3],
                                                  color: viewModel.color4)
                                    .onTapGesture {
                                        if !viewModel.choisOn{
                                            if viewModel.quiz[viewModel.questionIndex].answer[3].isTrue{
                                                viewModel.goodAnswer += 1
                                            }
                                            viewModel.checkColor()
                                            viewModel.color4 = viewModel.color
                                            viewModel.color2 = false
                                            viewModel.color3 = false
                                            viewModel.color1 = false
                                        }
                                    }
                                
                        }.padding()
                    }
                    
                    Spacer()
                    //MARK: - Botton bar
                    HStack(spacing: 20){
                        
                        PassIconView(image: Image(.lighting), number: Int(viewModel.store[0].lighting))
                        
                        PassIconView(image: Image(.pacmen), number: Int(viewModel.store[0].pacmen))
                        Spacer()
                        StartButton(action: {
                            if viewModel.questionIndex + 1 >= viewModel.quiz.count{
                                viewModel.quizVictory()
                                gameOver = true
                            }
                        }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                    }.padding()
                    
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
        .animation(.easeInOut, value: isPresent)
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
    QuizQuestionsView(viewModel: ViewModel())
}
