protocol MessageBuilder {
    var name: String { get }
    func buildMessage() -> String
}

class MyClass: MessageBuilder {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        // 표현식을 이용해서 계산한 결과
        // 표현식에 조건문에서 반환이 있는 경우에는 return 생략 불가능함
        // 마지막 표현식이 함수의 반환 타입과 일치할 경우 함수의 결과로 반환 return을 생략할 수 있다]
        return "Hello " + name
    }
}

// some : 안에 있는 반환타입이 무엇인지를 안 알려주기 위해서 사용. 접근도 막아주는 표과
// Equatable : 비교연산자를 사용할 수 있는 protocol

func doubleFunc1 (value: Int) -> some Equatable {
    return value * 2
}

func doubleFunc2 (value: String) -> some Equatable {
    value  + value
}

let intOne = doubleFunc1(value: 10)
print(intOne)
let stringOne = doubleFunc2(value: "Hello")
print(stringOne)

// 동작하지 않음
//if (intOne == stringOne)  {
//    
//}
