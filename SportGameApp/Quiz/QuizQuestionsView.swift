//
//  QuizQuestionsView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct QuizQuestionsView: View {
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
                        .frame(width: 331, height: 134)
                        .cornerRadius(50)
                    Text(quiz[questionIndex].title)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 40)
                        .multilineTextAlignment(.center)
                }
                
                //MARK: - Answers
                ForEach(quiz[questionIndex].answer) { answer in
                    ButtonMenu(text: answer.title, multicolor: true, answer: answer.isTrue)
                        .padding(6)
                }
                
                Spacer()
                //MARK: - Botton bar
                HStack{
                    Image(.lighting)
                        .resizable()
                        .frame(width: 63, height: 53)
                    Spacer()
                    Image(.pacmen)
                        .resizable()
                        .frame(width: 63, height: 53)
                    Spacer()
                    StartButton(action: {
                        //actions
                    }, image: "arrow.right",cornerRadius: 40, width: 118, height: 54).font(.title)
                }.padding(.horizontal, 30)
                
            }
            
        }
    }
}

#Preview {
    QuizQuestionsView()
}
