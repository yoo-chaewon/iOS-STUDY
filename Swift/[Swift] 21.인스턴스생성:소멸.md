## [Swift] 인스턴스 생성/소멸 (init/deinit)

인스턴스를 생성하는 **이니셜라이저**와 클래스의 인스턴스가 소멸될 때 호출되는 **디이니셜라이저**, 그리고 이와 관련된 것들에 대해 알아봅니다.

- 프로퍼티 초기값
- 이니셜라이저 **`init`**
- 디이니셜라이저 **`deinit`**



#### 프로퍼티 초기값

- 스위프트의 모든 인스턴스는 초기화와 동시에 `모든 프로퍼티에 유효한 값이 할당`되어 있어야 합니다.
- 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 됩니다.

```swift
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let jason: PersonA = PersonA()

// 기본값이 인스턴스가 지녀야 할 값과 맞지 않다면
// 생성된 인스턴스의 프로퍼티에 각각 값 할당
jason.name = "jason"
jason.age = 30
jason.nickName = "j"
```

> 이것은 의도와 맞지 않을 수 있음.
>
> 👉 초기화와 동시에 프로퍼티에 값들을 할당해주고 싶은 경우



#### 이니셜라이저(initializer)

- `프로퍼티 초기값을 지정하기 어려운 경우`에는 이니셜라이저 **`init`**을 통해 인스턴스가 가져야 할 초기값을 전달할 수 있습니다.

```swift
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")
```



#### 👉 프로퍼티의 초기값이 꼭 필요 없을 때

- `옵셔널` 을 사용!
- **class** 내부의 **init**을 사용할때는 **convenience** 키워드 사용

```swift
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

//👉 중복된 코드를 막기 위해서.
// 위와 동일한 기능 수행
// convenience init(name: String, age: Int, nickName: String) {
//       init(name: name, age: age) 
//       self.nickName = nickName
//  }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")﻿
```

- `convenience init`

- 암시적 추출 옵셔널은 인스턴스 사용에 **꼭 필요하지만 초기값을 할당하지 않고자 할 때** 사용

  > 초기화할 때 전달되기 어려운 값들인 경우, owner오면 세팅해주겠다.

```swift
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
// 강아지는 주인없이 산책하면 안돼요!
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
// happy가 주인 jenny와 산책을 합니다
```





#### 실패가능한 이니셜라이저

- 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있습니다.
- 인스턴스 생성에 `실패`하면 **nil**을 반환합니다.
- 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입입니다.
- **`init?`**을 사용합니다.

```swift
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) { //nil이 될 수 있으므로 옵셔널
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.characters.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)
let batman: PersonD? = PersonD(name: "", age: 10)

print(joker) // nil
print(batman) // nil
//👉 범주 넘었기 때문에
```



#### 디이니셜라이저(deinitializer)

- **`deinit`**은 클래스의 인스턴스가 `메모리에서 해제되는 시점`에 호출됩니다.
- 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있습니다.
- **`deinit`**은 매개변수를 지닐 수 없습니다.
- 자동으로 호출되므로 직접 호출할 수 없습니다.
- 디이니셜라이저는 **클래스 타입에만** 구현할 수 있습니다.
- 인스턴스가 메모리에서 해제되는 시점은 **ARC(Automatic Reference Counting)** 의 규칙에 따라 결정됩니다.
- **ARC**에 대해 더 자세한 사항은 아래 [ARC 문서](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html)를 참고하세요. 

```swift
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }//사람이 떠나면, 강아지 변수도 바뀔 수 있도록.
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다
```