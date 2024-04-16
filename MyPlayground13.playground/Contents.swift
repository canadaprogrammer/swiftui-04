import Foundation

//struct Address {
//    private var cityname: String = ""
//    
//    var city: String {
//        get { cityname }
//        set { cityname = newValue.uppercased()}
//    }
//}
// var address = Address()
//address.city = "London"
//
//print(address.city)

@propertyWrapper
struct FixCase {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    @FixCase var country: String
}

var contact = Contact(name: "John Smith", city: "London", country: "United Kingdom")

print("\(contact.name) \(contact.city) \(contact.country)")

// 프로퍼티 랩퍼를 선언하여 반복적으로 사용
//
//@propertyWrapper
//struct MinMaxVal {
//    var value: Int
//    var min: Int
//    var max: Int
//    
//    init(wrappedValue: Int, min: Int, max: Int) {
//        value = wrappedValue
//        self.min = min
//        self.max = max
//    }
//    
//    var wrappedValue: Int {
//        get { return value }
//        set {
//            if newValue > max {
//                value = max
//            } else if newValue < min {
//                value = min
//            } else {
//                value = newValue
//            }
//        }
//    }
//}

// generic
@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    var min: V
    var max: V
    
    init(wrappedValue: V, min: V, max: V) {
        value = wrappedValue
        self.min = min
        self.max = max
    }
    
    var wrappedValue: V {
        get { return value }
        set {
            if newValue > max {
                value = max
            } else if newValue < min {
                value = min
            } else {
                value = newValue
            }
        }
    }
}
struct Demo {
    @MinMaxVal(min: 10, max: 150) var value: Int = 100
    @MinMaxVal(min: "Apple", max: "Orange") var value2: String = "Banana"
    @MinMaxVal(min: Date(), max: Calendar.current.date(byAdding: .month, value: 1, to: Date())! ) var value3: Date = Date()
}

var demo = Demo()
print(demo.value2)
demo.value2 = "Pear"
print(demo.value2)

print(demo.value3)
demo.value3 = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
print(demo.value3)
demo.value3 = Calendar.current.date(byAdding: .month, value: 2, to: Date())!
print(demo.value3)
