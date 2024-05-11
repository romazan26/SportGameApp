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
    var answer: Answer
    var color = false
    var delete = false
    
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(color ? answer.isTrue ? .green : .red : .backGroundButtton)
                if delete && !answer.isTrue {
                    Text(answer.title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.gray)
                    //.strikethrough(true, color: .red)
                }else{
                    Text(answer.title)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                }
            }
            
            .frame(width: width, height: height)
        
        }
    
  
}

#Preview {
    ButtonAnswerView(answer: QuizQuestion.getQuizQuestions()[0].answer[0])
}
