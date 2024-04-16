//
//  Car.swift
//  CarInfoApp
//
//  Created by Jungjin Park on 2024-04-16.
//

import SwiftUI
// protocol에는 실행구문을 넣을 수 없다.
protocol CarDescriptionProtocol {
    var brand: String { get }
    var modelName: String { get }
    var year: Int { get}
    
    func carInfo() ->String
}

// extension에 실행구문을 넣는다
// protocol extension은 override 될 수 없다
//extension CarDescriptionProtocol {
//    func carInfo() -> String {
//        return "Brand: \(brand)\nModel: \(modelName)\nYear: \(year)"
//    }
//}
protocol Fuel {
    var fuelEfficiency: Double { get set }
    var isGasoline: Bool { get set }
    
    var fuelEfficiencyString: String { get }
    var isGasolineString: String { get }
}

protocol Electric {
    var autoLevel: Int { get set }
}

extension Fuel {
    var fuelEfficiencyString: String {
        String(format: "%.2f", fuelEfficiency)
    }
    
    var isGasolineString: String {
        isGasoline ? "가솔린" : "디젤"
    }
}

class Car: Identifiable, CarDescriptionProtocol {
    let id = UUID()
    var brand: String
    var modelName: String
    var year: Int
    var doorCount: Int
    var weight: Double
    var height: Double
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Double, height: Double) {
        self.brand = brand
        self.modelName = modelName
        self.year = year
        self.doorCount = doorCount
        self.weight = weight
        self.height = height
    }
    
    func returnType() -> String {
        return ""
    }
    func carInfo() -> String {
        return "Brand: \(brand)\nModel: \(modelName)\nYear: \(year)"
    }
}

class ElectricCar: Car, Electric {
    var electricEfficiency: Double
    var fullChargeHours: Double
    var autoLevel: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Double, height: Double, electricEfficiency: Double, fullChargeHours: Double, autoLevel: Int) {
        self.electricEfficiency = electricEfficiency
        self.fullChargeHours = fullChargeHours
        self.autoLevel = autoLevel
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    override func returnType() -> String {
        return "전기"
    }
    override func carInfo() -> String {
        return super.carInfo() + "\nElectric Efficiency: \(electricEfficiency)km/h\nFull Charge Hours: \(fullChargeHours)\n자율주행 \(autoLevel)단계"
    }
//    func carInfo() -> some View {
//        Section(header: Text("Electric Car")) {
//            Text("\(brand)")
//            Text("\(modelName)")
//            Text("\(electricEfficiency)")
//            Text("\(fullChargeHours)")
//            Text("\(autoLevel)")
//        }
//    }
    
}

class OilCar: Car, Fuel {
    var isAutomatic: Bool
    var fuelEfficiency: Double
    var isGasoline: Bool
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Double, height: Double, isAutomatic: Bool, fuelEfficiency: Double, isGasoline: Bool) {
        self.isAutomatic = isAutomatic
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    override func returnType() -> String {
        return "내연기관"
    }
    
    override func carInfo() -> String {
        return super.carInfo() + "\n\(isAutomatic ? "자동변속" : "수동변성")\n\(isGasoline ? "가솔린" : "디젤")\nFuel Efficiency: \(fuelEfficiency)km/h"
    }
//    func carInfo() -> some View {
//        Section(header: Text("Oil Car")) {
//            Text("\(brand)")
//            Text("\(modelName)")
//            Text("\(isAutomatic ? "자동변속" : "수동변성")")
//            Text("\(isGasoline ? "가솔린" : "디젤")")
//            Text("\(fuelEfficiency)")
//        }
//    }
}

class HybridCar: Car, Electric {
    var fuelEfficiency: Double
    var isGasoline: Bool
    var autoLevel: Int
    
    init(brand: String, modelName: String, year: Int, doorCount: Int, weight: Double, height: Double, fuelEfficiency: Double, isGasoline: Bool, autoLevel: Int) {
        self.fuelEfficiency = fuelEfficiency
        self.isGasoline = isGasoline
        self.autoLevel = autoLevel
        super.init(brand: brand, modelName: modelName, year: year, doorCount: doorCount, weight: weight, height: height)
    }
    
    override func returnType() -> String {
        return "하이브리드"
    }
    override func carInfo() -> String {
        return super.carInfo() + "\n\(isGasoline ? "가솔린" : "디젤")\nFuel Efficiency: \(fuelEfficiency)km/h\n자율주행 \(autoLevel)단계"
    }
//    func carInfo() -> some View {
//        Section(header: Text("Hybrid Car")) {
//            Text("\(brand)")
//            Text("\(modelName)")
//            Text("\(isGasoline ? "가솔린" : "디젤")")
//            Text("\(fuelEfficiency)")
//            Text("\(autoLevel)")
//        }
//    }

}
