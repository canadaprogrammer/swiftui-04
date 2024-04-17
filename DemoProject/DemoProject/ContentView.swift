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
        VStack {
            VStack {
                Text("Text1")
                Text("Text2")
                MyHStackView()
            }
            Text("Text5")
        }
    }
}

struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Text3")
            Text("Text4")
        }
    }
}
#Preview {
    ContentView()
}
