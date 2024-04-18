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
            GeometryReader { geometry in
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .border(Color.black)
                //                .frame(minWidth: 100, maxWidth: 300, minHeight: 100, maxHeight: 100, alignment: .center)
                    .frame(minWidth: 0, maxWidth: geometry.size.width / 2, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}
#Preview {
    ContentView()
}
