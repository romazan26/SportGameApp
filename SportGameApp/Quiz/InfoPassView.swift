//
//  InfoPassView.swift
//  SportGameApp
//
//  Created by Роман on 30.04.2024.
//

import SwiftUI

struct InfoPassView: View {
    var body: some View {
        ZStack(alignment: .top) {
            BlurUIView(style: .systemChromeMaterialDark)
                .opacity(0.8)
                .ignoresSafeArea()
                
            ZStack{
                RoundedRectangle(cornerRadius: 29)
                    .frame(width: 331, height: 196)
                    .foregroundStyle(.white)
                VStack{
                    HStack(spacing: 20){
                        Image(.lighting)
                            .resizable()
                            .frame(width: 63, height: 63)
                        Text("Delete two objects")
                            .foregroundStyle(.black)
                            .font(.system( size: 20, weight: .bold))
                    }
                    HStack(spacing: 20){
                        Image(.pacmen)
                            .resizable()
                            .frame(width: 63, height: 63)
                        Text("Delete one objects")
                            .foregroundStyle(.black)
                            .font(.system( size: 20, weight: .bold))
                    }
                }
            }.padding(.top, 100)
        }
    }
}

#Preview {
    InfoPassView()
}
