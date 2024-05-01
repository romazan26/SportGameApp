//
//  BluButtonView.swift
//  SportGameApp
//
//  Created by Роман on 28.04.2024.
//

import SwiftUI

struct BluButtonView: View {
    @State var text = ""
    @State var image = ""

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(.colorButton)
                .frame(width: 331, height: 80)
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.white)
                Text(text)
                    .foregroundStyle(.white)
                    .font(.system( size: 14, weight: .bold))
                    
            }
        }
    }
}

#Preview {
    BluButtonView()
}
