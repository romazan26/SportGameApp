//
//  ToolBarMoneyView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct ToolBarMoneyView: View {
    var money = 0
    var body: some View {
        HStack{
            //MARK: - Money
            ZStack{
                RoundedRectangle(cornerRadius: 13.0)
                    .foregroundStyle(.greenApp)
                HStack {
                    Image(.money)
                        .resizable()
                        .frame(width: 21, height: 21)
                    Text("\(money)")
                }
                .foregroundStyle(.white)
            }
            .frame(width: 99, height: 38)
        }.padding()
    }
}

#Preview {
    ToolBarMoneyView()
}
