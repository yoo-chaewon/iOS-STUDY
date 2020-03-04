## [Swift] 상속



#### 스위프트 상속

- 상속은 `클래스`, `프로토콜` 등에서 가능합니다.
- 열거형, 구조체는 상속이 불가능합니다.
- 스위프트의 클래스는 `단일상속`으로, 다중상속을 지원하지 않습니다.
- 이번 파트에서는 클래스의 상속에 대해서 알아봅니다.



#### 문법

```javascript
class 이름: 상속받을 클래스 이름 {
    /* 구현부 */
}
```



#### 사용

- **final** 키워드를 사용하면 재정의(**override**)를 방지할 수 있습니다.
- **static** 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능 합니다.
- **class** 키워드를 사용해 타입 메서드를 만들면 재정의가 가능합니다.
- **class** 앞에 **final**을 붙이면 **static** 키워드를 사용한것과 동일하게 동작합니다.
- **override** 키워드를 사용해 부모 클래스의 메서드를 재정의 할 수 있습니다.

> final class = static

```swift
// 기반 클래스 Person
class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있다 --> override 불가
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도 
    // final 키워드를 사용하면 재정의 할 수 없습니다
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다
    final class func finalCalssMethod() {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
  //var name: String = ""
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("override type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 할 수 없습니다
//    override static func typeMethod() {    }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 할 수 없습니다
//    override func sayHello() {    }
//    override class func finalClassMethod() {    }

}
```



#### 구동 확인

```swift
let yoo: Person = Person()
let hana: Student = Student()

yoo.name = "yagom"
hana.name = "hana"
hana.major = "Swift"

yoo.selfIntroduce()
// 저는 yagom입니다

yoo.selfIntroduce()
// 저는 hana이고, 전공은 Swift입니다

Person.classMethod()
// type method - class

Person.typeMethod()
// type method - static

Person.finalCalssMethod()
// type method - final class


Student.classMethod()
// overriden type method - class

Student.typeMethod()
// type method - static

Student.finalCalssMethod()
// type method - final class
```