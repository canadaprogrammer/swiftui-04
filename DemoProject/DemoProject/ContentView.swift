//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    @State var fileopen: Bool = true
    var body: some View {
        Text("Hello, ") + Text("world!") // 하나의 TextView
    }
}

#Preview {
    ContentView()
}
