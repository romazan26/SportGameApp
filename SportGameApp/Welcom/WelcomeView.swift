//
//  WelcomeView.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State var isLoading = true
    var body: some View {
        VStack {
                if !isLoading {
                    LoadingView()
                } else {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                        Image(.background)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        Color(.backGround)
                            .opacity(0.85)
                        VStack{
                            Text("WELCOME")
                                .foregroundStyle(.white)
                                .font(.system(size: 55))
                                .bold()
                            Text("Test your sports knowledge now")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                        }.padding(.top, 130)
                        StartButton(action: {
                            //action
                        }, text: "PLAY NOW", image: "")
                        .padding(.top, 690)
                    }
                }
            
        }.onAppear(perform: {
            startLoading()
    })
       
    }
    private func startLoading(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1){
            isLoading = false
        }
    }
}

#Preview {
    WelcomeView()
}
