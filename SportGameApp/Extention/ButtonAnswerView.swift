//
//  ButtonAnswerView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct ButtonAnswerView: View {

    var multicolor = true
    var width: CGFloat = 331
    var height: CGFloat = 80
    var question: Answer
    @ObservedObject var viewModel: ViewModel
    
    
    @State var background = Color(.backGroundButtton)
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(background)

                    Text(question.title)
                    .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
            }
            .frame(width: width, height: height)
            .onTapGesture {
                if multicolor {
                    if  question.isTrue {
                        viewModel.goodAnswer += 1
                    }
                    background = question.isTrue ? .green : .red
                }
            }
        }
}

#Preview {
    ButtonAnswerView( question: QuizQuestion.getQuizQuestions()[0].answer[0], viewModel: ViewModel())
}
