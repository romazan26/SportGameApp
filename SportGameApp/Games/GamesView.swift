//
//  GamesView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct GamesView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
            VStack{
                Text("GAMES")
                    .foregroundStyle(.white)
                    .font(.system(size: 41,weight: .bold))
                    .padding(.top, 140)
                
                //MARK: - Quiz
                NavigationLink {
                    QuizView(viewModel: viewModel)
                } label: {ButtonMenu(text: "QUIZ")}.padding(.top, 40)
                
                //MARK: - FotoQuiz
                NavigationLink {
                    FotoQuizView(viewModel: viewModel)
                } label: {ButtonMenu(text: "PHOTO GUESS")}

               //MARK: - TrueFalseGame
                NavigationLink {
                    TrueFalseGameView(viewModel: viewModel)
                } label: {ButtonMenu(text: "TRUE/FALSE")}

                
                Spacer()
                NavigationLink {
                    BonusGameView(viewModel: viewModel)
                } label: {
                    BluButtonView(text: "BONUS GAME", image: "star.fill")
                }

            }
            .padding()
            .background(content: {
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    Color(.backGround)
                        .ignoresSafeArea()
                    Image(.ball)
                        .resizable()
                        .frame(width: 245, height: 343)
                        .padding(.top, 345)
                        .padding(.leading,227)
                }
                       })
            
            .foregroundStyle(.white)
        
        .ignoresSafeArea()
        .navigationBarBackButtonTitleHidden()
        .toolbar(content: {
            ToolbarItem {
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundStyle(.white)
                }
            }
//            ToolbarItem(placement: .navigationBarLeading) {
//                Button {
//                    print("Custom Action")
//                    // 2
//                    dismiss()
//                    
//                } label: {
//                    HStack {
//                        Image(systemName: "chevron.backward")
//                            .foregroundStyle(.white)
//                    }
//                }
//            }
        })
        
    }
}

#Preview {
    NavigationView(content: {
        GamesView(viewModel: ViewModel())
    })
    
}
