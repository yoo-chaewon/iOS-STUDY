## [Swift] 상수와 변수

#### 상수와 변수의 선언

- let : 상수 선언 키워트
- var : 변수 선언 키워드

```swift
// 상수와 변수 선언
let 상수이름: 타입 = 값
var 변수이름: 타입 = 값

// 값의 타입이 명확하다면 타입 생략 가능
let 상수이름 = 값
var 변수이름 = 값

// 상수와 변수 활용
let constant: String = "변경이 불가능한 상수 let"
var variable: String = "변경이 가능한 변수 var"

variable = "다른 값 할당 가능"
// constant = "상수는 값을 변경할 수 없다 ! " // 오류발생
```



#### 상수 선언 후, 값 할당하기

- 선언을 먼저 한 뒤, 나중에 값을 할당하려는 상수나 변수는 반드시 타입을 명시해야함.

```swift
let sum: Int
let inputA: Int = 100
let inputB: Int = 200

// 선언 후 첫 할당
sum = inputA + inputB

// sum = 1 // 그 이후에는 다시 값을 바꿀 수 없다 👉 오류발생

// 변수도 선언한 뒤 나중에 할당 가능
var nickName: String

nickName = "yoo"

// 변수는 다시 다른 값을 할당해도 문제가 없다
nickName = "chaewon"
```

