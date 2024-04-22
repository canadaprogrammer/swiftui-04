//
//  ContentView.swift
//  StorageDemo
//
//  Created by Jungjin Park on 2024-04-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
