//
//  TruFalseGameView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct TrueFalseGameView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 15){
            Text("TRUE/FALSE")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 80)
            Text("Choose the correct answers")
                .font(.system(size: 15))
            ZStack{
                Capsule(style: .circular)
                    .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 159,height: 51)
                    .foregroundStyle(.blue)
                Text("10 rounds").font(.system(size: 24))
            }
            Spacer()
            NavigationLink {
              TrueFalseGameAnswerView(viewModel: viewModel)
            } label: {
                BluButtonView(text: "START")
                    .cornerRadius(50)
                    .shadow(color: .blue, radius: 20)
            }.padding()

        }
        .onAppear(perform: {
    
            viewModel.questionIndex = 0
        })
        .foregroundStyle(.white)
        .padding()
        .navigationBarBackButtonTitleHidden()
        .toolbar(content: {
            NavigationLink {
                SettingsView()
            } label: {
                Image(systemName: "gearshape")
                    .foregroundStyle(.white)
            
            }
        })
        
        .background(
                Color.backgrounFoto
        ).ignoresSafeArea()
    }
    
}

#Preview {
    TrueFalseGameView(viewModel: ViewModel())
}
