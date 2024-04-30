//
//  InfoPassView.swift
//  SportGameApp
//
//  Created by Роман on 30.04.2024.
//

import SwiftUI

struct InfoPassView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            BlurUIView(style: .light)
                .ignoresSafeArea()
                .blur(radius: 3.0)
                .opacity(0.1)
                
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
                            .font(.title3)
                            .bold()
                    }
                    HStack(spacing: 20){
                        Image(.pacmen)
                            .resizable()
                            .frame(width: 63, height: 63)
                        Text("Delete one objects")
                            .foregroundStyle(.black)
                            .font(.title3)
                            .bold()
                    }
                }
            }
        }
        
        .onTapGesture(perform: {
            dismiss()
        })
    }
}

#Preview {
    InfoPassView()
}
