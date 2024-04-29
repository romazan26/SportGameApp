//
//  QuestionsView.swift
//  SportGameApp
//
//  Created by Роман on 29.04.2024.
//

import SwiftUI

struct QuestionsView: View {
    
    @ObservedObject var viewModel: ViewModel
    var quiz = QuizQuestion.getQuizQuestions()
    private var questionIndex = 0
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
                    Text("\(questionIndex + 1) / \(quiz.count)")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                }
                
                //MARK: - Question
                ZStack{
                    Color(.backGroundButtton)
                        .frame(width: 331, height: 114)
                        .cornerRadius(50)
                    Text(quiz[questionIndex].title)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                }
                //MARK: - Answers
                ForEach(quiz[questionIndex].answer) { answer in
                    ButtonAnswerView(text: answer.title, multicolor: true, answer: answer.isTrue)
                        .padding(5)
                }
                Spacer()
                //MARK: - Botton bar
                HStack(spacing: 20){
                    Spacer()
                    PassIconView(image: Image(.lighting), number: 0)
                    
                    PassIconView(image: Image(.pacmen), number: 0)
                    Spacer()
                    StartButton(action: {
                        //actions
                    }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                }.padding(.horizontal, 30)
                
            }.padding(.bottom)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                ToolBarMoneyView()
            }
        })
    }
    }
}

#Preview {
    QuestionsView(viewModel: ViewModel())
}
