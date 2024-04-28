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
    var multicolor = false
    var answer = false
    
    @State private var background = Color(.backGroundButtton)
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(background)
                HStack{
                    Image(systemName: icon)
                    Text(text)
                        .font(.title3)
                        .bold()
                }.foregroundStyle(.white)
            }
            .frame(width: 331, height: 80)
            .onTapGesture {
                if multicolor {
                    background = answer ? .green : .red
                }
            }
        }
    
}

#Preview {
    ButtonMenu()
}
