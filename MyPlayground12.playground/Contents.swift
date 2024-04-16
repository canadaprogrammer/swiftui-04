struct SampleStruct {
    var name: String
    init(name: String) {
        self.name = name
    }
    func buildHelloMsg() {
        "Hello " + name
    }
}

class SampleClass {
    var name: String
    init(name: String) {
        self.name = name
    }
    func buildHelloMsg() {
        "Hello " + name
    }
}

let myStruct1 = SampleStruct(name: "Mark")
var myStruct2 = myStruct1
myStruct2.name = "David"
print(myStruct1.name)   // Mark
print(myStruct2.name)   // David

let myClass1 = SampleClass(name: "Mark")
var myClass2 = myClass1
myClass2.name = "David"
print(myClass1.name)    // David
print(myClass2.name)    // David

/*
 참조타입은 메모리 할당을 도와주고 주소 값만 가지고 작동을 한다. 그래서 복사 후 내용을 바꾸면 복사 전의 내용도 바뀐다. 왜냐하면 주소값이 같으므로. - 클래스
 구조체는 값을 할당하는 순간 주소가 아닌 구조체 값만을 가지고 있다.
 스위프트에서는 왠만하면 구조체가 메모리 사용에 효율적이기 때문에 구조체를 사용한다.
 참조값은 참조를 찾아가 지워야한다.
 상속은 클래스는 가능하나 구조체는 불가능
 구조체는 물리적으로 메모리 공간을 차지하고 있기 때문에 확장이 어렵다
 클래스는 상속으로 확장하고, 구조체는 프로토콜을 이용해서 확장한다
 구조체를 물리적으로 메모리를 차지하고 효율적으로 사용하나 확장이 어렵다
 클래스는 어딘가 존재하는 메모리의 공간이 자유로우나 여기저기 떠다닌다.
 클래스는 빠르게 확장하고 삭제도 빠르나 여기저기에 존재해서 ..
 스위프트에서는 프로토콜로 구조체의 확장이 가능하고 메모리 관리가 효율적이여서 사용을 권장한다
 싱글톤 패턴에서는 클래스를 사용하는데 .. 의 이유로 다른 곳에서는 구조체를 사용한다.
*/

