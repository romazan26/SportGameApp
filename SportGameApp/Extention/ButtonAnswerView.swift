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
    var question: Answer
    var color = false
  
    
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(color ? question.isTrue ? .green : .red : .backGroundButtton)

                    Text(question.title)
                    .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
            }
            
            .frame(width: width, height: height)
        
        }
    
  
}

#Preview {
    ButtonAnswerView(question: QuizQuestion.getQuizQuestions()[0].answer[0])
}
