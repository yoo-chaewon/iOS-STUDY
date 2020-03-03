## [Swift] 옵셔널



#### 옵셔널이란?

- `값이 있을 수도, 없을 수도 있음을 표현 `

  > 즉, 옵셔널이 아닌 값에 nil 을 넣으면 오류가 남.

- nil이 할당 될 수 있는지 없는지 표현

```swift
// someOptionalParm에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?) {
       // ....
}

/// someOptionalParm에 nil이 할당 될 수 없다.
func someFunction(someParam: Int) {
       // ....
}

someFunction(someOptionalParam: nil)
//someFunction(someParam: nil) //👉 오류, 옵셔널로 선언해주지 않았기 때문.
// 즉, 컴파일 단계에서 안전하게 optional 값을 처리할 수 있음.
```



#### 옵셔널을 쓰는 이유

- **명시적 표현**
  1. nil의 가능성을 코드만으로 표현가능
  2. 문서 / 주석 작성 시간 절약

- **안전한 사용**
  1. 전달받은 값이 옵셔널이 아니라면 nil체크를 하지 않고 사용 가능
  2. 예외 상황을 최소화 하는 안전한 코딩
  3. 효율적 코딩



#### 옵셔널 문법과 선언

- 옵셔널 문법 = `enum` + `general `
- 옵셔널 선언

```swift
enum Optional<Wrapped>: ExpressibleByNiliteral {
         case none
         case some(Wrapped)
}

let optionalValue: Optional<Int> = nil // 완전한 문법
let optionalValue: Int? =nil // ?로 옵셔널임을 명시
```



- **옵셔널 표현**

1. `느낌표(!)`를 이용한 암시적 `추출 옵셔널` 

```swift
// Implicitly Unwrapped Optional
var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)") // 출력
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
```

> 👉 기존 변수처럼 사용 가능

2. 물음표(?)`를 이용한 `옵셔널`

```javascript
// Optional
var optionalValue: Int? = 100
// Int값이 들어있을 수도 있고, 없을 수도 있는 변수

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// nil 할당 가능
optionalValue = nil

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1
```

> 👉 기존 변수처럼 사용 불가능