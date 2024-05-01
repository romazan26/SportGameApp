//
//  WelcomeView.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isPresented = false
    @State var isLoading = true
    var body: some View {
        VStack {
                if isLoading {
                    LoadingView()
                } else {
                    VStack{
                        VStack{
                            Text("WELCOME")
                                .foregroundStyle(.white)
                                .font(.system(size: 55,weight: .bold))
                                
                            Text("Test your sports knowledge now")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                        }.padding(.top, 100)
                        Spacer()
                        StartButton(action: {
                            isPresented = true
                        }, text: "PLAY NOW", image: "")
                        .padding(.bottom)
                        
                    }.background {
                        ZStack{
                            Image(.background)
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                            Color(.backGround)
                                .ignoresSafeArea()
                                .opacity(0.85)
                        }
                    }
                }
            
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            MenuView()
        })
        .onAppear(perform: {
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
