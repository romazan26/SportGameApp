//
//  FotoQuizCellView.swift
//  SportGameApp
//
//  Created by Роман on 02.05.2024.
//

import SwiftUI

struct FotoQuizCellView: View {
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        VStack(spacing: 20) {
            Image(viewModel.fotoQuiz[viewModel.questionIndex].foto)
                .resizable()
                .frame(width: 301, height: 301)
            HStack(spacing: 10){
                VStack(spacing: 10){
                    ButtonAnswerView(width: 159,
                                     height: 80,
                                     answer: viewModel.fotoQuiz[viewModel.questionIndex].answer[0],
                                     color: viewModel.color1,delete: viewModel.isDelete1)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.fotoQuiz[viewModel.questionIndex].answer[0].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color1 = viewModel.color
                            viewModel.color2 = false
                            viewModel.color3 = false
                            viewModel.color4 = false
                        }
                    }
                    ButtonAnswerView(width: 159,
                                     height: 80,
                                     answer: viewModel.fotoQuiz[viewModel.questionIndex].answer[2],
                                     color: viewModel.color2,delete: viewModel.isDelete3)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.fotoQuiz[viewModel.questionIndex].answer[2].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color2 = viewModel.color
                            viewModel.color1 = false
                            viewModel.color3 = false
                            viewModel.color4 = false
                        }
                    }
                }
                VStack(spacing: 10){
                    ButtonAnswerView(width: 159,
                                     height: 80,
                                     answer: viewModel.fotoQuiz[viewModel.questionIndex].answer[1],
                                     color: viewModel.color3,delete: viewModel.isDelete2)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.fotoQuiz[viewModel.questionIndex].answer[1].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color3 = viewModel.color
                            viewModel.color2 = false
                            viewModel.color1 = false
                            viewModel.color4 = false
                        }
                    }

                    ButtonAnswerView(width: 159,
                                     height: 80,
                                     answer: viewModel.fotoQuiz[viewModel.questionIndex].answer[3],
                                     color: viewModel.color4,delete: viewModel.isDelete4)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.fotoQuiz[viewModel.questionIndex].answer[3].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color4 = viewModel.color
                            viewModel.color2 = false
                            viewModel.color3 = false
                            viewModel.color1 = false
                        }
                    }

                }
            }
        }
    }
}

#Preview {
    FotoQuizCellView(viewModel: ViewModel())
}
