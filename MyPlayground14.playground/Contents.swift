// literal: 문자열 값이 나열
//var treeArray: [String] = ["Pine", "Oak", "Yew"]
var treeArray = ["Pine", "Oak", "Yew"] // 타입 추론 (생략)

var priceArray = [Float]()

var nameArray = [String](repeating: "MyString", count: 10) // 문자열 배열 생성

let firstArray = ["Red", "Green", "Blue"]
let secondArray = ["Indigo", "Violet"]

let thirdArray = firstArray + secondArray

print(thirdArray.count) // 배열의 요소 개수
print(treeArray.isEmpty) // 빈 배열인지 여부
print(treeArray[2])
treeArray[1] = "RedWood"

treeArray.append("BlackWood") // 요소 추가
treeArray += ["Maple"]
treeArray = treeArray + ["Birch", "OldTree"]

treeArray.insert("YellowTree", at: 0) // 요소 삽입

treeArray.shuffle() // 랜덤 배열
print(treeArray)
print(treeArray.randomElement() ?? "") // 랜덤 요서
