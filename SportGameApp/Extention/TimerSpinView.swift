//
//  TimerSpinView.swift
//  SportGameApp
//
//  Created by Роман on 03.05.2024.
//

import SwiftUI

struct TimerSpinView: View {
    @StateObject var viewModel: ViewModel
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    @State var timeRemaning: String = ""
    
    
    
    var body: some View {
        ZStack(alignment: .center) {
            Color(.backGroundButtton)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack{
                Text("Not yet").font(.system(size: 16))
                Text(timeRemaning)
                    .font(.system(size: 35, weight: .bold))
            }.foregroundStyle(.white)
        }
        .onReceive(timer, perform: { _ in
                updateTimeremaning()
            
        })
    }
    func updateTimeremaning (){
        let futurDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: viewModel.store[0].freeSpinDate ?? Date()) ?? Date()
        let remating = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futurDate)
        let hour = remating.hour ?? 0
        let minute = remating.minute ?? 0
        let second = remating.second ?? 0
        viewModel.checkTimer(minute: minute, second: second)
        timeRemaning = "\(hour):\(minute):\(second)"
    }
}

#Preview {
    TimerSpinView(viewModel: ViewModel())
}
