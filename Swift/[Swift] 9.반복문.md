## [Swift] 반복문

> for-in
>
> while
>
> repeat-while



#### for-in 구문

- 기존 언어의 for-each 구문과 유사합니다.

  > 자바에서,
  >
  > ```java
  > for(int a: arrs){
  > 
  > }
  > ```

- Dictionary의 경우 이터레이션 아이템으로 튜플이 들어옵니다. (하단 애플 문서의 튜플 부분 참조) 

- **for-in 구문 기본 형태**

```javascript
for item in items {
    /* 실행 구문 */
}
```

- **for-in 구문의 사용**

```javascript
var integers = [1, 2, 3]
let people = ["yoo": 10, "eric": 15, "mike": 12]

for integer in integers {
    print(integer)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입
for (name, age) in people {
    print("\(name): \(age)")
}
```



#### while 구문

- **while 구문의 기본 형태**

```javascript
while 조건 {
    /* 실행 구문 */
}
```

- **while 구문의 사용**

```javascript
while integers.count > 1 {
    integers.removeLast()
}
```



#### 📌 repeat-while 구문

- 기존 언어의 `do-while` 구문과 형태/동작이 유사합니다.
- **repeat-while 구문의 기본 형태**

```swift
repeat {
    /* 실행 구문 */
} while 조건
```

- **repeat-while 구문의 사용**

```swift
repeat {
    integers.removeLast()
} while integers.count > 0
```