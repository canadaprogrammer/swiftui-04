//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
               doSomething()
            }) {
                Text("Do Something")
            }
        }
    }
    
    func doSomething() {
        print("Start \(Date())")
        Task {
            await takesTooLong()
        }
        print("End \(Date())")
    }
    
    func takesTooLong() async {
        sleep(5)
        print("Async task completed at \(Date())")
    }
}
#Preview {
    ContentView()
}
