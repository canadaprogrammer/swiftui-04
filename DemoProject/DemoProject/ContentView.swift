//
//  ContentView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-17.
//

import SwiftUI

struct ContentView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    let textLimit = 5
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            Text(userName
                .prefix(textLimit))
            Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
                .font(.largeTitle)
                .aspectRatio(contentMode: .fit)
                .frame(height: 10)
        }
    }
}
#Preview {
    ContentView()
}
