//
//  ButtonTrueFalseView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct ButtonTrueFalseView: View {
    
    var width: CGFloat = 331
    var height: CGFloat = 80
    var answer: Bool
    var title: String
    var color = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(color ? answer ? .green : .red : .backGroundButtton)

            Text(title)
                .font(.system(size: 20, weight: .bold))
            .foregroundStyle(.white)
        }
        
        .frame(width: width, height: height)
    }
}

#Preview {
    ButtonTrueFalseView( answer: false, title: "True")
}
