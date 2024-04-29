//
//  PassIconView.swift
//  SportGameApp
//
//  Created by Роман on 29.04.2024.
//

import SwiftUI

struct PassIconView: View {
    var image = Image(.lighting)
    var number = 0
    var body: some View {
        ZStack {
            image
                .resizable()
            .frame(width: 53, height: 53)
            ZStack{
                Circle()
                    .foregroundStyle(.colorButton)
                Text("\(number)")
                    .foregroundStyle(.white)
            }
            .offset(x: 23, y: -20)
            .frame(width: 26, height: 26)
        }
    }
}

#Preview {
    PassIconView()
}
