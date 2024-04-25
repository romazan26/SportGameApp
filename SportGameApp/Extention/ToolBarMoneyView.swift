//
//  ToolBarMoneyView.swift
//  SportGameApp
//
//  Created by Роман on 25.04.2024.
//

import SwiftUI

struct ToolBarMoneyView: View {
    var body: some View {
        HStack{
            ZStack{
                
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundStyle(.backGroundButtton)
                Image(systemName: "plus")
                    .foregroundStyle(.white)
            }.frame(width: 38, height: 38)
            ZStack{
                RoundedRectangle(cornerRadius: 13.0)
                    .foregroundStyle(.greenApp)
                HStack {
                    Image(.money)
                        .resizable()
                    .frame(width: 21, height: 21)
                    Text("100")
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
