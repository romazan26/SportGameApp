//
//  QuizView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack{
            Spacer()
            NavigationLink {
                QuizQuestionsView(viewModel: viewModel)
            } label: {
                BluButtonView(text: "START")
            }.padding()

        }
        .toolbar(content: {
            ToolbarItem {
                Image(systemName: "gearshape")
                    .foregroundStyle(.white)
            }
        })
        .background(Image(.quiz)
            .resizable()
            .frame(width: 400)
            .ignoresSafeArea()
        )
    }
}

#Preview {
    QuizView(viewModel: ViewModel())
}
