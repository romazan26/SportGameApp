//
//  TimerSpinView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct TimerSpinView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color(.backGroundButtton)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack{
                Text("Not yet").font(.system(size: 16))
                Text("23:59:52")
                    .font(.system(size: 35, weight: .bold))
            }.foregroundStyle(.white)
        }
    }
}

#Preview {
    TimerSpinView()
}
