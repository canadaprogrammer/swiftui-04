//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    var body: some View {
        VStack {
            myLayout {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit) // for image not squeezed
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Button(action: {
                    myLayout = AnyLayout(HStackLayout())
                }) {
                    Text("HStack")
                }
                Button(action: {
                    myLayout = AnyLayout(VStackLayout())
                }) {
                    Text("VStack")
                }
                
            }
        }
    }
}
#Preview {
    ContentView()
}
