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
