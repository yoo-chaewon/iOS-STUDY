## [Swift] 클래스

##### 구조체와 매우 유사

> 구조체: 값타입
>
> 클래스: 참조타입



####  클래스란?

- 클래스는 `참조`(reference) 타입입니다.
- 타입이름은 `대문자` 카멜케이스를 사용하여 정의합니다.
- Swift의 클래스는 `다중 상속이 되지 않습니다`.



#### 클래스 문법

- **정의 :** "class" 키워드 사용

```javascript
class 이름 {
	/* 구현부 */
}
```

- **프로퍼티 및 메서드 구현**

```swift
class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100 

    // 불변 프로퍼티
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100 
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    

    // 타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}
```

> 재정의 가능 메소드 👉 class func
>
> 재정의 불가 메소드 👉 static func



- **클래스 사용**

  > var, let 모두 내부 mutable 프로퍼티 수정가능

```javascript
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다 -> let
// 컴파일 오류 발생
//mutableReference.immutableProperty = 200


// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// ‼️ 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능합니다
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없습니다
// 컴파일 오류 발생
//immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는 
// 인스턴스 생성 후에 수정할 수 없습니다
// 컴파일 오류 발생
//immutableReference.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없습니다
// 컴파일 오류 발생
//mutableReference.typeProperty = 400
//mutableReference.typeMethod()
```

- Struct vs Class

  > Struct : 값 참조
  >
  > let선언의 경우 인스턴스 프로퍼티 변경 X

  > Class : 참조타입
  >
  > let선언에도 인스턴스 프로퍼티 변경 O

#### 예) 학생 클래스

```swift
class Student {
	// 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있음.
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 사용은 선택사항
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 인스턴스 생성
var yoo: Student = Student()
yoo.name = "yoo"
yoo.class = "스위프트"
yoo.selfIntroduce()   // 저는 스위프트반 yoo입니다

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 jina입니다
```

