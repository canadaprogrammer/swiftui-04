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
            Text("Main Title")
                .font(.custom("Copperplate", size: 58))
//                .padding()  // border 안쪽에 padding
                .border(Color.black)
                .padding()  // border 바깥쪽에 padding
        }
    }
}
#Preview {
    ContentView()
}
