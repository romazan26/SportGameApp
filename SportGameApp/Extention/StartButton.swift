//
//  StartButton.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

struct StartButton: View {
    var action: () -> Void = {}
    @State var text = "Play"
    @State var image = "star"
    var body: some View {
        Button(action: action, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.colorButton)
                    .frame(width: 331, height: 80)
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
