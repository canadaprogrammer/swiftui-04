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
    var accountBlance: Float = 0
    var accountNumber: Int = 0
}

var bankAccount = BankAccount()

print(bankAccount.accountBlance)
print(bankAccount.accountNumber)
