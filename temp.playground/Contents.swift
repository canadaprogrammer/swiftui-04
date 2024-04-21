
var alphabetList = ["A", "B", "C", "D", "E", "F", "G"]

print(alphabetList)
//alphabetList[1...4] = ["H", "I", "J"] //["A", "H", "I", "J", "F", "G"]
alphabetList[1...3] = ["H", "I", "J", "K"] //["A", "H", "I", "J", "K", "E", "F", "G"]
print(alphabetList)

let removed = alphabetList.remove(at:7)

alphabetList.insert("H", at:7)

var stringSet: Set<String> = ["abc", "def", "abc"]
print(stringSet)

let number: Set = [1,3,4,5,2]
print(number.sorted())
print(number)

let sortedNumber: [Int] = number.sorted()
//let sortedNumberSet: Set<Int> = number.sorted() // runtime error
print(sortedNumber)

var airports = ["YYZ":"Toronto", "DUB":"Dublin"]
airports["APL"] = nil
print(airports)
for airportCode in airports.keys.sorted() {
    print("\(airportCode)")
}

var numbers = [ 2, 3, 1, 4, 5]
print(numbers.sorted(by: { $0 > $1 }))

func makeIncrementer(forIncrement amount: Int) -> () -> Void {
    var runningTotal = 0
    func incrementer() -> Void {
        runningTotal += amount
        print("\(runningTotal)")
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
print("\(Beverage.allCases.count) beverages available")

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    
    print("QR code: \(productCode).")
}
enum Planet: Int, CaseIterable {
    case mercury, venus, earth,  jupiter = 4, saturn
}
for planetOrder in Planet.allCases {
    print("\(planetOrder): \(planetOrder.rawValue)")
}
enum CompassPoint: String, CaseIterable {
    case north, south = "South", east, west
}
for direction in CompassPoint.allCases {
    print("\(direction.rawValue)")
}
let possiblePlanet = Planet(rawValue: 2)
if let somePlanet = Planet(rawValue: 3) {
    switch somePlanet {
    case .earth:
        print("Planet order 3 is Earth")
    default:
        print("Planet order 3 is not Earth")
    }
} else {
    print("Planet Order 3 is not exist")
}
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}


print(evaluate(product))
