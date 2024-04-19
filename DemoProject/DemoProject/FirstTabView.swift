//
//  FirstTabView.swift
//  DemoProject
//
//  Created by Jungjin Park on 2024-04-19.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        Text("View One")
            .onAppear(perform: {
                print("onAppear triggered")
            })
            .onDisappear(perform: {
                print("onDisappear trigger")
            })
    }
}

#Preview {
    FirstTabView()
}
