//
//  StartButton.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

struct StartButton: View {
    var action: () -> Void = {}
    @State var text = ""
    @State var image = ""
    @State var cornerRadius: CGFloat = 25.0
    var width: CGFloat = 331.0
    var height: CGFloat = 80
    
    var body: some View {
        Button(action: action, label: {
            ZStack{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(.colorButton)
                    .frame(width: width, height: height)
                HStack {
                    Image(systemName: image)
                        .foregroundStyle(.white)
                    Text(text)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                }
            }
        })
    }
}

#Preview {
    StartButton()
}
