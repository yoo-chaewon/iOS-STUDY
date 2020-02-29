## [Swift] 명명법 / 콘솔로그 / 문자열 보간법

#### 명명법

- Lower Camel Case : function, method, variable, constant

  > someVariableName

- Upper Camel Case : type(class, struct, enum, extension)

  > Person, Point, Week

- 대소문자를 구분



#### 콘솔로그

- print : 단순 문자열 출력
- dump : 인스턴스의 자세한 설명(description 프로퍼티)까지 출력

```swift
class Person{
    var name = "채원"
    var age = 24
}

let yoo : Person = Person()
```

✔️ print 결과

> __lldb_expr_3.Person

✔️dump 결과

> __lldb_expr_3.Person #0
>
> name: "채원"
>
> age: 24



#### 문자열 보간법(String Interpolation)

- 프로그램 실행 중 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해 사용

  > \ ()

