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
                            .frame(width: 331, height: 114)
                            .cornerRadius(50)
                        Text(viewModel.quiz[viewModel.questionIndex].title)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 40)
                            .multilineTextAlignment(.center)
                    }
                    //MARK: - Answers
                    ForEach(viewModel.quiz[viewModel.questionIndex].answer) { answer in
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
                            viewModel.win()
                        }, image: "arrow.right",cornerRadius: 40, width: 110, height: 54).font(.title)
                    }.padding(.horizontal, 30)
                    
                }.padding()
            if isPresent {
                InfoPassView()
                    .onTapGesture {
                        isPresent = false
                    }
            }
        }
        .animation(.easeInOut, value: isPresent)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                ToolBarMoneyView()
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
