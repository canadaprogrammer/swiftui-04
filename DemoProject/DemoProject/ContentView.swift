//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing: 20){
            HStack {
                Image(systemName: "goforward.10")
                Image(systemName: "goforward.15")
                Image(systemName: "goforward.30")
            }
            .font(.largeTitle)
            HStack(alignment: .top) {
                Spacer()
                Text("Q1 Sales")
                Spacer()
                VStack(alignment: .trailing) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                .padding()
                Spacer()
            }
        }
    }
}
#Preview {
    ContentView()
}
