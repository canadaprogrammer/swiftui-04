//
//  DetailView.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI

struct DetailView: View {
    var fuelType: String = "전기"
    @StateObject var carModel = CarListModel()
    var body: some View {
        List(carModel.cars) { car in
            Text(car.brand)
            if(car.returnType() == fuelType) {
                car.carInfo()
            }
        }
    }
}

#Preview {
    ContentView()
}
