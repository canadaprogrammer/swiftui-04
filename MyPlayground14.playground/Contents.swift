//var bookDict: [String:String] = ["100-432112": "Wind in the Willows"]
var bookDict1 = ["100-432112": "Wind in the Willows"]
// 빈 딕셔너리 초기화 정수형 키값, 문자열
var myDict = [Int:String]()

let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
let values = ["Value1","Value2","Value3","Value4","Value5","Value6","Value7","Value8","Value9"]

//let bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
// mutable 은 메모리를 여유롭게 잡고, immutable 은 메모리를 타이트하게 잡는다. 메모리 관리를 위해서 immutable 을 사용하는 것이 필요하다
// 메모리를 많이 쓰면 배터리를 많이 사용하므로 될 수 있는면 mutable 보다는 immutable의 사용 권장
// var 보다는 let 을 써라
var bookDict = Dictionary(uniqueKeysWithValues: zip(1..., values))

print(bookDict.count)
print(bookDict[1, default: "NoValue"]) // 딕셔너리는 해당 값의 유무를 모르므로 default 값을 설정해줘야 한다
bookDict[1231000] = "Value"

for (bookId, value) in bookDict {
    print("Book Id: \(bookId), Value: \(value)")
}
