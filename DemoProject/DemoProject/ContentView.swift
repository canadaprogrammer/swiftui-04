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
//            Button {
//                print("Clicked")
//            } label: {
//                Text("Button")
//            }
            Button("Button", systemImage: "tortoise") {
                print("Clicked")
            }
        }
    }
}
#Preview {
    ContentView()
}
