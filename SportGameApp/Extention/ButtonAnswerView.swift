//
//  ButtonAnswerView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct ButtonAnswerView: View {

    var width: CGFloat = 331
    var height: CGFloat = 80
    @State var question: Answer
    @ObservedObject var viewModel: ViewModel
    
    
    @State var background = Color(.backGroundButtton)
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle( viewModel.choisOn ? Color(.backGroundButtton) : background)

                    Text(question.title)
                    .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
            }
            .frame(width: width, height: height)
            
            .onTapGesture {
                if viewModel.choisOn {
                    if  question.isTrue {
                        viewModel.goodAnswer += 1
                    }
                    background = question.isTrue ? .green : .red
                    viewModel.choisOn = false
                    
                }
            }
        }
}

#Preview {
    ButtonAnswerView( question: QuizQuestion.getQuizQuestions()[0].answer[0], viewModel: ViewModel())
}
