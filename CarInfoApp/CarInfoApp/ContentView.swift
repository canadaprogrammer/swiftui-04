//
//  ContentView.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
    var carModel = cars
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: DetailView(fuelType: "전기", carModel: carModel)) {
                    Text("전기")
                }
                NavigationLink(destination: DetailView(fuelType: "내연기관", carModel: carModel)) {
                    Text("내연기관")
                }
                NavigationLink(destination: DetailView(fuelType: "하이브리드", carModel: carModel)) {
                    Text("하이브리드")
                }
            }
            .navigationTitle("TopGear")
        }
    }
}

#Preview {
    ContentView()
}
