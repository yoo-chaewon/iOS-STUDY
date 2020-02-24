## [Swift] guard

`guard`문을 몇번 사용해 보면서 `if`문과 비슷하다고 느껴졌다. 하지만 사용할 수록, 때에 따라서 if문 대신 guard문을 사용하는 경우가 생겼고, 그래서 guard문에 대해서 공부해보고자 한다.



> `guard` 문은 어떤 것을 검사하여, 그 다음에 오는 코드를 실행할지 말지 결정하는 것으로, `guard` 문에 조건문이 거짓이 될 때, `else` 문이 샐행되도록 한다.
>
> ‼️ `guard`문은 if문의 subset 개념이므로, `if`문으로 완벽히 대체할 수 있다. 그럼에도 `guard`문을 쓰는 이유는 가독성 때문이다. 함수 진입점에 `if`문을 나열하는 것 보다는 `guard` 문을 사용하여, 꼭 필요한 조건들을 걸러내면 조금 더 코드의 가독성이 좋아진다.



#### if 문 코드

```swift
func checkStr(str: String?){
    if str?.count ?? 0 > 0 {
        print(str ?? "")
    }else {
        print("내용을 입력해 주세요")
    }
}
```

### 👇

#### guard문 코드

```swift
func checkStrGuard(str: String?){
    guard let tmp = str,
        tmp.count > 0 else {
            print("내용을 입력해 주세요")
            return
    }
    print(tmp)
}
```

> guard 조건 else {조건이 false인 경우}

- `if`문을 쓰면 nil 체크 후에 unwrap을 위해서 ?? 등 디폴트로 값을 주어야 한다.
- 하지만, `guard`문을 쓰면 let으로 받아서 nil 체크를 하는 동시에 그 값을 guard 문 아래에서 계속 사용할 수 있다.



예시는 짧아서 그렇지만 복잡한 코드에서는 guard문의 장점이 명확하게 드러난다 ~