//
//  ButtonMenu.swift
//  SportGameApp
//
//  Created by Роман on 24.04.2024.
//

import SwiftUI

struct ButtonMenu: View {
    
    var text = ""
    var icon = ""
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.backGroundButtton)
                HStack{
                    Image(systemName: icon)
                    Text(text)
                        .font(.title3)
                        .bold()
                }.foregroundStyle(.white)
            }
        }).frame(width: 331, height: 80)
    }
}

#Preview {
    ButtonMenu()
}
