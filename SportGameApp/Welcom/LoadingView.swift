//
//  LoadingView.swift
//  SportGameApp
//
//  Created by Роман on 23.04.2024.
//

import SwiftUI

struct LoadingView: View {
    @State var progress: Float = 0
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            Color(.backGround)
                .ignoresSafeArea()
            Text("LOADING..")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
                .padding(.top, -150)
            ProgressBarView(progress: progress * 0.01)
                .frame(width: 165, height: 165)
               // .padding(.top, 381)
        }.onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if progress < 100{
                    progress += 1
                }else {
                    timer.invalidate()
                    
                }
            }
        })
    }
}

#Preview {
    LoadingView()
}
