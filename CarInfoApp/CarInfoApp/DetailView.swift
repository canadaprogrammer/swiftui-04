//
//  DetailView.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI

struct DetailView: View {
    var fuelType: String = "전기"
    var carModel: [Car]
    var body: some View {
        List {
            switch (fuelType) {
            case "전기":
                Section(header: Text("Electric Cars")) {
                    ForEach(carModel.filter {$0 is ElectricCar}, id: \.id) { car in
                        Text(car.carInfo())
                    }
                }
            case "내연기관":
                Section(header: Text("Oil Cars")) {
                    ForEach(carModel.filter {$0 is OilCar}, id: \.id) { car in
                        Text(car.carInfo())
                    }
                }
            case "하이브리드":
                Section(header: Text("Hybrid Cars")) {
                    ForEach(carModel.filter {$0 is HybridCar}, id: \.id) { car in
                        Text(car.carInfo())
                    }
                }
            default:
                Section(header: Text("Electric Cars")) {
                    ForEach(carModel.filter {$0 is ElectricCar}, id: \.id) { car in
                        Text(car.carInfo())
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
