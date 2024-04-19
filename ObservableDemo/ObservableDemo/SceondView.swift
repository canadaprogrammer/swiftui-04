//
//  SceondView.swift
//  ObservableDemo
//
//  Created by Jungjin Park on 2024-04-19.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer count = \(timerData.timeCount)")
                .font(.headline)
        }
    }
}

#Preview {
    SecondView()
        .environmentObject(TimerData())
}
