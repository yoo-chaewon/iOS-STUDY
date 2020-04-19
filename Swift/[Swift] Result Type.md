# [Swift] Result Type

Swift5의 Result Type을 사용하면 데이터 받아와서 디코딩해주는 코드(비동기로 API GET하는 코드)를 간단하고 명확하게 만들 수 있다.

> https://github.com/apple/swift-evolution/blob/master/proposals/0235-add-result.md





### Result Type을 사용하지 않을 시

1. 옵셔널로 구분(nil인지 아닌지로 확인)

   ```swift
   func fetchData<T: Decodable>(completion: @escaping (T?) -> Void){
       let url = URL(string: "http://echo.jsontest.com/key/value/one/two")!
       URLSession.shared.dataTask(with: url){ (data, response, error) in
           guard let data = data else {
               return completion(nil)
           }
           
           guard let model = try? JSONDecoder().decode(T.self, from: data) else {
               return completion(nil)
           }
           completion(model)
       }.resume()
   }
   
   fetchData { (data: [String:String]?) in//옵셔널로 확인
       if let data = data{
           print(data)
       }
   }
   
   //result
   /*
   ["one": "two", "key": "value"]
   */
   ```

   👉 nil인지 아닌지 여부로 데이터가 잘 받아지고 디코딩도 잘 되어지는지 확인한다.

2. 에러까지 구체적으로 명시해서 구분할 수 있다.

   ```swift
   enum APIError: Error{
       case data
       case decodingJSON
   }
   
   func fetchData<T: Decodable>(completion: @escaping (T?, APIError?) -> Void){
       let url = URL(string: "http://echo.jsontest.com/key/value/one/two")!
       URLSession.shared.dataTask(with: url){ (data, response, error) in
           guard let data = data else {
               return completion(nil, .data)
           }
           
           guard let model = try? JSONDecoder().decode(T.self, from: data) else {
               return completion(nil, .decodingJSON)
           }
           completion(model, nil)
       }.resume()
   }
   
   fetchData { (data: [String:String]?, error) in
       if let error = error{
           print(error)
       }
       
       if let data = data{
           print(data)
       }
   }
   ```

3. APIResult라는 Enum을 정의하여 처리할수도 있다.

   ```swift
   import UIKit
   
   enum APIResult<T>{
       case success(T)
       case failure(APIError)
       
       enum APIError: Error{
           case data
           case decodingJSON
       }
   }
   
   
   func fetchData<T: Decodable>(completion: @escaping (APIResult<T>) -> Void){
       let url = URL(string: "http://echo.jsontest.com/key/value/one/two")!
       URLSession.shared.dataTask(with: url){ (data, response, error) in
           guard let data = data else {
               return completion(.failure(.data))
           }
           
           guard let model = try? JSONDecoder().decode(T.self, from: data) else {
               return completion(.failure(.decodingJSON))
           }
           completion(.success(model))
       }.resume()
   }
   
   fetchData { (result: APIResult<[String: String]>) in
       switch result {
       case .success(let model):
           print(model)
       case .failure(let error):
           print(error)
       }
   }
   ```

   



### Result Type 사용시

swift5는 standard library에 Result Type이 추가됨었다.

이제 위에 작성한 APIResult같은 enum을 따로 만들어 주지 않아도 된다.

👇 이와 같이 !

```swift
public enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}
```

```swift
 import UIKit

enum APIError: Error{
    case data
    case decodingJSON
}


func fetchData<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void){
    let url = URL(string: "http://echo.jsontest.com/key/value/one/two")!
    URLSession.shared.dataTask(with: url){ (data, response, error) in
        guard let data = data else {
            return completion(.failure(.data))
        }
        
        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
            return completion(.failure(.decodingJSON))
        }
        completion(.success(model))
    }.resume()
}

fetchData { (result : Result<[String: String], APIError>) in
    switch result {
    case .success(let model):
        print(model)
    case .failure(let error):
        print(error)
    }
}

```

- gurad let 대신 do catch를 쓸수도 있다.

  ```swift
  import UIKit
  
  enum APIError: Error{
      case data
      case decodingJSON
  }
  
  
  func fetchData<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void){
      let url = URL(string: "http://echo.jsontest.com/key/value/one/two")!
      URLSession.shared.dataTask(with: url){ (data, response, error) in
          guard let data = data else {
              return completion(.failure(.data))
          }
          
          do{
              let model = try JSONDecoder().decode(T.self, from: data)
              completion(.success(model))
          }catch{
              completion(.failure(.decodingJSON))
          }
      }.resume()
  }
  
  fetchData { (result : Result<[String: String], APIError>) in
      switch result {
      case .success(let model):
          print(model)
      case .failure(let error):
          print(error)
      }
  }
  ```

  