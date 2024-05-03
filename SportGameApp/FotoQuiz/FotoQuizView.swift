//
//  FotoQuizView.swift
//  SportGameApp
//
//  Created by Роман on 02.05.2024.
//

import SwiftUI

struct FotoQuizView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack(spacing: 15){
            Text("PHOTO GUESS")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 80)
            Text("Guess the football player from the photo")
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
                FotoQuestionsView(viewModel: viewModel)
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
        .toolbar(content: {
            ToolbarItem {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.white)
                }
            }
        })
        .background(
            ZStack {
                Color.backgrounFoto
                Image(.fotoQuizMedved)
                    .resizable()
                    .frame(width: 470,height: 520)
                    .opacity(0.68)
                    .offset(y: 100)
             
            .ignoresSafeArea()
            }
        ).ignoresSafeArea()
    }
}

#Preview {
    FotoQuizView(viewModel: ViewModel())
}
