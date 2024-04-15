import UIKit

var greeting = "Hello, playground"

//class 클래스 이믈: 부모 클래스 {     // 클래스 이름은 대문자로 시작
//    // 프로퍼티 :                // 관습적으로 소문자로 시작
//    // let, var 정의            // 소문자로 시작
//    // 인스턴스 메서드 : 게좌
//    // 타입 메서드 : 계자 이체
//}

// 회사마다 네이밍 컨벤션이라고 있어서 이름 설정시 규칙이 있음

class BankAccount {
    // 프로퍼티
    var accountNumber: Int = 0
    var accountBalance: Float = 0
    let fees: Float = 25.00
    
    var balanceLessFees : Float {
        get {
            return accountBalance - fees
        }
        set (newBalance){
            accountBalance = newBalance - fees
        }
    }
    
    lazy var myProperty: String = { // 사용하고 싶을 때 초기화하라는 것으로 lazy 를 사용. let 에는 lazy를 사용할 수 없음
        /* 오래 걸리는 작업
        var result = resourceIntensiveTask()
        result = processData(data: result)
         */
//        return result
        return ""
    }() // ()를 붙여 실행문으로 만들어 주면 {} 안의 실행결과가 myProperty 로 저장됨
    
    // 프로퍼티의 디폴트 값을 초기화해줘서 init() 이 빠져있음
    // 클래스는 참조타입이다. 타입이 불일치하면 오류 발생. 클래스는 생성자함수가 위임했기 때문에 생성자함수(init())가 필요. 디폴트 값을 초기화해줘서 init() 이 생략되어 있음
    // 구조체는 타입을 체크하는 과정이 필요 없다. 구조체는 항상 값을 가져야 한다.
    
    init() {
        accountNumber = 0
        accountBalance = 0
    }
    init(number: Int, balance: Float) {
        accountNumber = number
        accountBalance = balance
    }
    
    deinit {
        // 사라질 때 필요한 정리작업을 수행
        // 사용했던 메모리를 정리
        // 클래스만 있고 구조체는 없다.
        // 구조체는 값 자체를 날리면 없어진다.
        // 클래스는 참조체로 사용이 끝났음을 알려줘야 한다
    }
    // 인스턴스 메서드
    func displayBalance() -> Void {
        print("Number \(accountNumber)")
        print("Current Balance \(accountBalance)")
    }
    
    // class 타입 메서드 상속 재정의 가능, static 은 재정의 불가능
    class func getMaxBalance() -> Float {
        return 1000000.0
    }
}

var bankAccount = BankAccount()

bankAccount.balanceLessFees = 12123.12

print(bankAccount.accountNumber)
print(bankAccount.accountBalance)

bankAccount.displayBalance()

print(BankAccount.getMaxBalance())
