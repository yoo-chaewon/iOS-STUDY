# @IBInspectable & @IBDesignable

### 👩‍💻 @IBInspectable

- inspector를 보조할 수 있다.

  ```
  예를들어, storyboard에서 uiview의 테두리에 색을 넣고 싶으면
  👉 inspector에 나와있지 않기 때문에, View의 IBOutlet을 딴 다음, borderWidth와 borderColor를 저정해줘야 한다.
  👉 이 경우 IBInspectable을 사용하면 조금 더 편해진다 !
  ```

- inspector에서 해당 인터페이스 요소의 속성을 변경할 수 있게 하는 것이 IBInspectable이다.

  ```swift
  class borderView: UIView {
  
      @IBInspectable var borderWith : CGFloat{
          get{
              return layer.borderWidth
          }
          
          set{
              layer.borderWidth = newValue
          }
      }
      
      @IBInspectable var borderColor : UIColor? {
          get{
              return UIColor(cgColor: layer.borderColor!)
          }
          
          set{
              layer.borderColor = newValue?.cgColor
          }
      }
  }
  ```

  <img src="https://github.com/yoo-chaewon/iOS-STUDY/blob/master/_resource/images/IBInspectable.png" >

- 하지만 이 경우 "런타임"에는 속성이 적용된 것을 볼 수 있지만 storyboard상 즉, "컴파일타임" 실시간으로는 못본다. 이를 가능하게 해주는 것이 👇





### 👩‍💻 @IBDesignable

위 경우를 가능하게 해주는 것이 IBDesignable이다.

```swift
@IBDesignable
class borderView: UIView {

    @IBInspectable var borderWith : CGFloat{
        get{
            return layer.borderWidth
        }
        
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor : UIColor? {
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
        
        set{
            layer.borderColor = newValue?.cgColor
        }
    }
}
```

위에 @IBDesinable을 하면 실시간으로 볼 수 있다 !!!