//
//  ContentView.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var carModel = CarListModel()
    var body: some View {
        NavigationStack {
            NavigationLink(destination: DetailView(fuelType: "전기", carModel: carModel)) {
                Text("전기")
            }
            NavigationLink(destination: DetailView(fuelType: "내연기관", carModel: carModel)) {
                Text("내연기관")
            }
            NavigationLink(destination: DetailView(fuelType: "하이브리드", carModel: carModel)) {
                Text("하이브리드")
            }
//            List(carModel.cars) { car in
//                NavigationLink(destination: DetailView(fuelType: car.returnType())) {
//                    Text(car.returnType())
//                }
//            }
//            .navigationTitle("TopGear")
        }
//        List {
//            Section(header: Text("Electric Cars")) {
//                ForEach(carModel.cars.filter {$0 is ElectricCar}, id: \.id) { car in
//                    Text(car.modelName)
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
