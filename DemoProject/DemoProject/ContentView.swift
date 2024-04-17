//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    var body: some View {
        VStack {
            Text("Main Title")
                .font(.largeTitle)
            carStack
        }
    }
}
#Preview {
    ContentView()
}
