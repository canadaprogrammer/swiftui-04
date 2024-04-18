//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Text 1")
                .modifier(StandardTitle())
            Spacer()
            Text("Text 1")
                .modifier(StandardTitle())
            Spacer()
        }
    }
}
#Preview {
    ContentView()
}
