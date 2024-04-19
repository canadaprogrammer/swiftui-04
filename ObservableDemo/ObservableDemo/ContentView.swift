//
//  ContentView.swift
//  ObservableDemo
//
//  Created by Jungjin Park on 2024-04-19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var timerData: TimerData = TimerData()
    var body: some View {
        NavigationStack {
            VStack {
                Text("Timer count = \(timerData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Button(action: timerData.resetCount) {
                    Text("Reset Counter")
                }
            }
        }
    }
    
//    func resetCount() {
//        timerData.resetCount()
//    }
}

#Preview {
    ContentView()
}
