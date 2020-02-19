## [Swift]Extension

`Extension` 은 스위프트의 강력한 기능 중 하나. 익스텐션은 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능.

✔️ 익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의 할 수는 없다.



- 클래스의 상속과 비교

  |        | 상속                   | 익스텐션                                      |
  | ------ | ---------------------- | --------------------------------------------- |
  | 확장   | **수직 확장**          | **수평 확장**                                 |
  | 사용   | 클래스 타입에서만 사용 | 클래스, 구조체, 프로토콜, 제너릭 등 모든 타입 |
  | 재정의 | 재정의 가능            | 재정의 불가                                   |

  👉 따라서 상황과 용도에 맞게 상속과 익스텐션을 선택하여 사용



#### 익스텐션 문법

- `extension`키워드를 사용하여 선언

  ```swift
  extension name{
    //타입에 추가될 새로운 기능 구현
  }
  ```

- 기존에 존재하는 타입이 추가적으로 다른 프로토콜을 채택할 수 있도록 확장 시

  ```swift
  extension name: protocol1, protocol2, protocol3{
    //프로토콜 요구사항 구현
  }
  ```



##### 사용 예시

```swift
extension UIViewController{
}

class ViewController: UIViewController {
}

extension ViewController: CLLocationManagerDelegate{
}

extension ViewController: UITableViewDataSource{
}
```

