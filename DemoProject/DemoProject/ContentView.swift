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
        let detachedTask = Task.detached {
//            let result = await takesTooLong()
//            print("Date result: \(result)")
            async let result = takesTooLong()
            print("Date result: \(await result)")
        }
        print(detachedTask.isCancelled)
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date {
        sleep(5)
        print("Async task completed at \(Date())")
        return Date()
    }
}
#Preview {
    ContentView()
}
