## [Swift] 옵셔널 추출(Optional unwrapping)



#### 옵셔널 추출이란?

> 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것
>
> 방법 ✌️가지: 옵셔널 바인딩, 강제추출



#### 옵셔널 방식

1. ##### 옵셔널 바인딩(Optional Binding)

> 1. nil 체크 + 안전한 추출
> 2. 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 값을 꺼내옵니다.
> 3. if-let 방식 사용

```swift
func printName(_ name: String) {
    print(name)
}
// 1
var myName: String? = nil
//printName(myName)
// 전달되는 값의 타입이 다르기 때문에 컴파일 오류발생 👉 String? != String
if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}
// 2
var yourName: String! = nil
if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}

//‼️ name 상수는 if-let 구문 내에서만 사용가능
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생
//printName(name)


//‼️,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있음
// 모든 옵셔널에 값이 있을 때만 동작합니다
myName = "yoo"
yourName = nil

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yourName이 nil이기 때문에 실행되지 않습니다
yourName = "hana"

if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yoo and hana


```



2. ##### 강제추출(Fore Unwrapping) 👉 추천되는 방법은 아님 !

   옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식, 만약 값이 없을경우(nil) 런타임 오류가 발생하기 때문에 추천되지 않습니다.

   > `!`을 통해서 옵셔널의 값을 강제로 추출한다.

```swift
var myName: String? = "yoo"
var youName: String! = nil


printName(myName!) // yoo
myName = nil

//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생
yourName = nil

//printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생
```

