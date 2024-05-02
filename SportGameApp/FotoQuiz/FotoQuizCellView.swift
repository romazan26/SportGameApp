//
//  FotoQuizCellView.swift
//  SportGameApp
//
//  Created by Роман on 02.05.2024.
//

import SwiftUI

struct FotoQuizCellView: View {
    @ObservedObject var viewModel: ViewModel
    var fotoQuiz: FotoQuiz
    
    var body: some View {
        VStack(spacing: 20) {
            Image(fotoQuiz.foto)
                .resizable()
                .frame(width: 331, height: 331)
            HStack(spacing: 10){
                VStack(spacing: 10){
                    ButtonAnswerView(width: 159,height: 80, question: fotoQuiz.answer[0], viewModel: viewModel)
                ButtonAnswerView(width: 159,height: 80,question: fotoQuiz.answer[2], viewModel: viewModel)
                }
                VStack(spacing: 10){
                    ButtonAnswerView(width: 159,height: 80,question: fotoQuiz.answer[1], viewModel: viewModel)
                    ButtonAnswerView(width: 159,height: 80,question: fotoQuiz.answer[3], viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    FotoQuizCellView(viewModel: ViewModel(), fotoQuiz: FotoQuiz.getFotoQuiz()[0])
}
