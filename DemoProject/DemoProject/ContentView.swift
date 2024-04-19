//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

class DemoData: ObservableObject {
    @Published var userCount = 0
    
    func increment() {
        userCount += 1
    }
}
struct ContentView: View {
    @ObservedObject var demoData: DemoData = DemoData()
    var body: some View {
        VStack {
            Text("you are user number \(demoData.userCount)")
            
            Button(action: {
                demoData.increment()
            }) {
                Text("Increment")
                    .font(.largeTitle)
            }
        }
    }
}
#Preview {
    ContentView()
}
