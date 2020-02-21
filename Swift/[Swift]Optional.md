## [Swift]Optional 이해하기

> Swift는 안정성을 최우선으로 하는 언어로 알려져있다.
>
> Swift는 다양한 방법으로 안정성을 제공하는데 `Optional` 이 대표적인 예이다. `Optional` 덕분에 null Pointer 이슈를 쉽게 처리할 수 있게 되었다.



```swift
let ages = [11, 12, 13]
let first = ages.first + 1
//Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
```

first에서 저러한 오류가 난다. 이는 `Optional` 이 에러를 방지하는 역할을 하고 있다. 여기에서 Array타입의 `first` 속성은 `Optional` 타입이기 때문에 1을 더할 때 컴파일러가 먼저 문제점을 파악해서 알려준다.



👉 위의 문제를 해결해주기 위해서는 간단하게 `언래핑 optional` 을 만들어 주면 된다.

```swift
let ages = [11, 12, 13]
let first = ages.first! + 1
```

하지만 이는 현재는 잘 돌아가는 것 처럼 보이지만, 배열이 빈 경우 

```swift
let ages :[Double] = []
let first = ages.first! + 1
//error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).
```

이러한 오류가 생긴다.

> Optional 바인딩이나 nil-coalescing 연산자를 이용해 안전하게 optional을 언래핑할 수 있는 방법이 있다. 따라서 ! 을 남발하지 말자!
>
> 안전한 방법을 이용하면 크래쉬되지 않고도 갑의 존재여부를 처리할 수 있으며, force unwrapping연산자를 사용해 쉽게 크래쉬 상태를 만들 수 있다.



### 왜 Safety?

swift는 예상을 벗어난 동작으로부터 우리를 지켜준다. 위에서 본 null검사 외에도 타입 시스템, value semantic, collection 및 numberic 타입의 바운더리 검사, 자동메모리 관리 등을 통해 안전성을 제공한다.

따라서, 시뮬레이션에서 정상적으로 동작하더라도 새로운 상황에서 실제 기기로 사용하다가 문제가 발생할 수도 있고, 또 디버그 모드에서는 컴파일되었다가 릴리즈모드에서는 컴파일이 실패할 수 있다. 또한 이러한 문제가 바로 나타나지 않는다면 나중에 디버그하기도 힘들고 문제 원인을 찾기도 어려워 질 것이다.



### Optional

Optional이라는 개념은 변수의 값이 `nil` 일 수도 있다는 뜻이다. 반대로 non-Optional에 해당하는 값은 `nil` 이 될 수 없다는 것이다. 



#### 선언

optional 변수의 선언은 `?` 키워드를 사용한다.

```swift
var name : String?
name = nil
// name은 optional이므로 nil값 갖을 수 있다.
var str : String
str = nil
// str은 optional이 아니므로 nil값을 갖을 수 없다.
// 따라서 컴파일 에러가 발생한다.
```

> 이처럼 nil에 대한 컴파일 에러를 통해 개발자는 nil에 대한 명확한 예외처리가 강제되며, 런타임에 nil로 인한 문제를 컴파일 단계에서 예방할 수 있다. 👉 즉, Swift는 잠재적 오류에 대해 안전하다



#### Optional 변수의 이용

Optional 변수는 `nil` 을  갖을 수 있는 특별한 변수다. Optional 변수를 이용해 작업할 때는 **Optional을 해제하는 과정**이 추가적으로 필요하다.

```swift
var tmp: Int? = 10
var tmp2: Int = 20

print(tmp + tmp2)
//Value of optional type 'Int?' not unwrapped; did you mean to use '!' or '?'?
```

Int?(optional) 과 Int(non-optional)의 연산을 시도하면 위와 같은 에러가 뜬다.

tmp가 Optional 변수로 nil을 가질 가능성이 있기 때문에 이렇게 컴파일 단계에서 에러를 발생시킨다. 따라서 연산을 수행하기 위해서는 `unwrapping` 또는 `binding`과정이 필요하다.



#### # Optional Unwrapping(옵셔널 해제)

> Optional 변수에 Optional 껍데기를 벗겨내는 작업이다.

```swift
var num1 : Int? = 20
var num2 : Int = 10

if num1 != nil{
    let sum = num1! + num2
    print(sum)
}
```

if 문을 통해서 optional 변수의 값이 nil이 아닌지 판별한 후 `!` unwrapping키워드를 통해 강제로 값을 꺼내온다. 

👉 nil이 아닌 경우에만 계산이 된다 !



#### # Optional Binding(옵셔널 바인딩)

```swift
var num1 : Int? = 20
var num2 : Int = 10

if let tmpNum1 = num1{
    let sum = tmpNum1 + num2
    print(sum)
}
```

Optional Unwrapping과 비슷하지만 Optional값을 새로운 상수로 받고, 그 이후로 non-optional값을 사용한다는 차이점이 있다.

👉 따라서 새로 선언된 tmpNum1은 이미 non-Optional변수이기 때문에 `!` 키워드를 사용할 필요가 없다.



#### # Optional Chaining(옵셔널 체이닝)

여러 객체를 혼합해서 사용하다 보면 Optional 끼리의 연산이 필요한 경우가 있다. 이 경우 객체마다 옵셔널 바인딩을 사용하게 되면 if문이 복잡해진다.

Optional Chaining을 통해서 좀 더 간단하게 Optional 예외처리를 할 수 있다.

```swift
class A{
    var b : B?
}

class B{
    var c: String?
}

var a: A = A()
if ((a.b?.c) != nil){
    
}
```

이 경우 A의 프로퍼티 b의 c에 접근할 때 b에 대한 옵셔널, c에대한 옵셔널 총 2번의 바인딩이 필요하다.

이 경우 옵셔널 체이닝을 통해 한줄로 옵셔널 바인딩이 가능하다.

`a.b?.c`를 통해 b의 옵셔널, c의 옵셔널 바인딩을 모두 처리 가능하다.