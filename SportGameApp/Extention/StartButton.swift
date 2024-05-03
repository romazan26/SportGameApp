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
    var money = false
    var width: CGFloat = 331.0
    var height: CGFloat = 80
    
    var body: some View {
        Button(action: action, label: {
            ZStack{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(.colorButton)
                    .frame(width: width, height: height)
                HStack {
                    if !money{
                        Image(systemName: image)
                            .foregroundStyle(.white)
                    } else {
                        Image(.money)
                    }
                    Text(text)
                        .foregroundStyle(.white)
                        .font(.system( size: 26, weight: .bold))
                }
            }
        })
    }
}

#Preview {
    StartButton()
}
