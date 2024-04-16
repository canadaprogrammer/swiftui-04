//
//  ContentView.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
//    @StateObject private var carModel = CarListModel()
    var body: some View {
        NavigationStack {
            NavigationLink(destination: DetailView(fuelType: "전기")) {
                Text("전기")
            }
            NavigationLink(destination: DetailView(fuelType: "내연기관")) {
                Text("내연기관")
            }
            NavigationLink(destination: DetailView(fuelType: "하이브리드")) {
                Text("하이브리드")
            }
//            List(carModel.cars) { car in
//                NavigationLink(destination: DetailView(fuelType: car.returnType()))
//            }
//            .navigationTitle("TopGear")
        }
    }
}

#Preview {
    ContentView()
}
