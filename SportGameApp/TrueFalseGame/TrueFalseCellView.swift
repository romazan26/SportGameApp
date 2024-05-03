//
//  TrueFalseCellView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct TrueFalseCellView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.backGroundButtton)
                Text(viewModel.trueFalseGame[viewModel.questionIndex].title)
                    .foregroundStyle(.white)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding(30)
            }.frame(width: 331, height: 279)
                
                Spacer()
            HStack(spacing: 10){
               
                    ButtonTrueFalseView(width: 159,
                                        height: 80,
                                        answer: viewModel.trueFalseGame[viewModel.questionIndex].isTrue,
                                        title: "True", color: viewModel.color1,
                                        delete: viewModel.isDelete1)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.trueFalseGame[viewModel.questionIndex].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color1 = viewModel.color
                            viewModel.color2 = false
                        }
                    }
                ButtonTrueFalseView(width: 159,
                                    height: 80,
                                    answer: !viewModel.trueFalseGame[viewModel.questionIndex].isTrue, 
                                    title: "False",
                                    color: viewModel.color2,
                                    delete: viewModel.isDelete2)
                    .onTapGesture {
                        if !viewModel.choisOn{
                            if viewModel.trueFalseGame[viewModel.questionIndex].isTrue{
                                viewModel.goodAnswer += 1
                            }
                            viewModel.checkColor()
                            viewModel.color2 = viewModel.color
                            viewModel.color1 = false
                        }
                    }
            }
           
            }
        }
    
    }



#Preview {
    TrueFalseCellView(viewModel: ViewModel())
}
