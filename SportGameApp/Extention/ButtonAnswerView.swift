//
//  ButtonAnswerView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct ButtonAnswerView: View {
    var text = ""
    var icon = ""
    var multicolor = true
    var answer = false
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
            .frame(width: 331, height: 80)
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
