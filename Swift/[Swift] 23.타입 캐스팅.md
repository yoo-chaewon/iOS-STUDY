## [Swift] 타입 캐스팅



#### 스위프트 타입 캐스팅

- **인스턴스의 타입을 확인** 하는 용도  
- 클래스의 인스턴스를 **부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인** 하는 용도
- **`is`**, **`as`**를 사용합니다.

** 형변환은 'ex. let someDouble = Double(2)'  타입 캐스팅이 아니라 `새로운 값`을 생성하는 것입니다.*



#### 예제 클래스

```swift
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}
// 인스턴스 생성
var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()
```



#### 타입확인

**is**를 사용하여 타입을 확인합니다.

```swift
var result: Bool

result = yagom is Person // true
result = yagom is Student // false
result = yagom is UniversityStudent // false

result = hana is Person // true
result = hana is Student // true
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
} // yagom은 사람입니다

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다
```



#### 업 캐스팅(Up Casting)

- **`as`**를 사용하여 **부모클래스의 인스턴스**로 사용할 수 있도록 컴파일러에게 타입정보를 전환해줍니다.
- **`Any`** 혹은 **`AnyObject`**로도 타입정보를 변환할 수 있습니다.
- 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 무방합니다.

```javascript
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person() // as Any 생략가능
```



#### 다운 캐스팅(Down Casting)

> `as?` 또는 `as!`를 사용하여 **자식 클래스의 인스턴스**로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해줍니다. 

**A. 조건부 다운 캐스팅** : `as?`

- `as?`를 사용합니다.
- 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 `nil`을 반환하기 때문에 결과의 타입은 `옵셔널 타입`입니다.

```swift
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil
// 실패 가능성을 내포하기 때문에 nil이 반환될 수 있음 👉 옵셔널
```



**B. 강제 다운 캐스팅** : `as!`

- `as!`를 사용합니다.
- 캐스팅에 실패하면, 즉 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 **런타임 오류**가 발생합니다.
- 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환합니다.

```javascript
var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류
```



#### 활용

```swift
func doSomethingWithSwitch(someone: Person) {
    switch someone {
    case is UniversityStudent:
        (someone as! UniversityStudent).goToMT()
    case is Student:
        (someone as! Student).goToSchool()
    case is Person:
        (someone as! Person).breath()
    }
}

doSomethingWithSwitch(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomethingWithSwitch(someone: jenny) // 등교를 합니다
doSomethingWithSwitch(someone: yagom) // 숨을 쉽니다

// 바로 값 반환.
func doSomething(someone: Person) {
    if let universityStudent = someone as? UniversityStudent {
        universityStudent.goToMT()
    } else if let student = someone as? Student {
        student.goToSchool()
    } else if let person = someone as? Person {
        person.breath()
    }
}

doSomething(someone: mike as Person) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: mike) // 멤버쉽 트레이닝을 갑니다 신남!
doSomething(someone: jenny) // 등교를 합니다
doSomething(someone: yagom) // 숨을 쉽니다
```