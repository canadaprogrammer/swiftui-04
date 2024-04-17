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
                Text("Text1")
            }
            HStack {
                Text("Text3")
                Text("Text4")
            }
            Text("Text5")
        }
        
    }
}

#Preview {
    ContentView()
}
