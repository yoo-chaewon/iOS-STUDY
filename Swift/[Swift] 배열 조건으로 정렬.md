# [Swift] 배열 조건으로 정렬

[클로저](https://github.com/yoo-chaewon/iOS-STUDY/blob/master/Swift/%5BSwift%5D%2017.클로저%20고급.md)

```swift
var animals = ["cat", "lion" "bird", "dog"]

//후행 클로저
animals.sort(){(one: String, two: String) -> Bool in
    return one < two
}

//반환타입 생략
animals.sort(){(one, two) in
    return one < two
}

//단축인자이름
animals.sort(){
    return $0 < $1
}

//암시적 반환 표현 : return 키워드 생략
animals.sort{ $0 < $1}

animals.sort(by : <)

print(animals)

```

