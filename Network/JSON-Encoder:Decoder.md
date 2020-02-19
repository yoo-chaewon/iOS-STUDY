## JSON

> 객체를 JSON문자열로 인코딩하고 JSON문자열을 객체로 디코딩 한다.
>
> - JSON Encoder
> - JSON Decoder
> - Encoding/ Decoding Strategy



#### JSON(Java Script Object Notation)

- 네트워크를 통해 데이터를 주고받을 때 사용하는 개방형 표준 포멧
  - 예전에는 xml을 주로 사용했지만 요즘은 대부분 JSON사용
- 디셔너리와 유사한 구조로 데이터를 저장함
  - {"key": value}
  - Swift 딕셔너리라고 생각하면 쉬움
- 전체데이터가 일반 text로 되어있기 때문에, 가독성이 높고 파싱이 쉽다는 장점이 있음.



### JSON으로 바꿀때는 JSON Encoder 사용

- 모든 형식을 json으로 바꿀 수 있음.

- JSON으로 인코딩 되는 형식은 반드시 Encodable 프로토콜을 사용해야 함.

  - 반대로 JSON으로부터 Decoding되는 형식은 Decodable형식을 채용해야함.

  - encoding과 decoding이 모두 가능하다면, Codable 프로토콜로 대체해야함.

    👉 선언 해줘야함.

    ```swift
    struct phone : Codable{
      var mobile: String
      var home: String
      var office: String
    }
    ```

- 인코더 객체 생성

  ```swift
  let encoder = JSONEncoder()
  ```

  인코더는 객체에 저장되어 있는 데이터를 JSON문자열로 바꿔줌.

  ```swift
  do{
      let josnData = try encoder.encode(contact) 
    //json문자열을 바이너리 형태로.
    //주로 서버로 보낼때는 바이너리형태로 보냄. 여기에서는 실제 결과를 확인하기 위해서 문자열로 바꿀것임. 
      if let jsonStr = String(data: josnData, encoding: .utf8){
          print(jsonStr)
      }
  }catch{
      print(error)
  }
  ```

- 줄바꿈과 공백 추가

  ```swift
  encoder.outputFormatting = .prettyPrinted
  ```

- Json Encoder는 속성이름을 key로 바꿀때 카멜케이스 규칙을 사용함.

  ```swift
  encoder.keyEncodingStrategy = .convertToSnakeCase
  
  // 이거 사용하면 단어 사이에 언더바로 (first_name)
  ```

- 날짜 인코딩

  ```swift
  //표준 방식
  encoder.dataEncodingStrategy = .iso8601
  
  //Date 포멧 사용
  let formatter = DateFormatter()
  formatter.dataFormat = "yyyy/MM/dd"
  encoder.dateEncodingStrategy = .formatted(formatter)
  ```



### JSON 에 저장된 데이터를 인스턴드로 바꿀때는 JSONDecoder사용

- 디코더 객체 생성

  ```swift
  let decoder = JSONDecoder()
  ```

- JSON을 데이터로 디코딩

  ```swift
  let jsonStr = """
  {
    "person" : [
      {
        "email" : "ohwow5@naver.com",
        "id" : "1",
        "gender" : "female",
        "phone" : {
          "office" : "02",
          "mobile" : "010-4277-6232",
          "home" : "031"
        },
        "name" : "chaewon",
        "address" : "seoul"
      }
    ]
  }
  """
  
  guard let jsonData = jsonStr.data(using: .utf8) else{
      fatalError()
  }
  
  let decoder = JSONDecoder()
  do {
      let c = try decoder.decode(Contact.self, from: jsonData)
      dump(c)
  }catch{
      print(error)
  }
  ```

  - Json key와 속성의 이름이 동일하고, Json에 저장되어 있는 값과 속성이 같다면 문제없이 디코딩됨.

    👉 키와 속성의 이름이 다르거나, 호환이 되지 않으면 디코딩이 실패함.

- key의 Decoding전략을 사용하여 카멜케이스로 변경하는 방법

  SnakeCase(언더바) -> 카멜케이스

  ```swift
  let decoder = JSONDecoder()
  
  decoder.keyDecodingStrategy = .convertFromSnakeCase
  ```

- double형식으로 디코딩 된 날짜를 Date 형식으로 변경

  ```swift
  decoder.dateDecodingStrategy = .ios8601
  ```



> 테스트를 위한 URL: https://api.androidhive.info/contacts/
>
> 👉 sample JSON형식 있음
>
> JSONEncoder : https://developer.apple.com/documentation/foundation/jsonencoder
>
> JSONDecoder : https://developer.apple.com/documentation/foundation/jsondecoder
>
> Codable : https://developer.apple.com/documentation/swift/codable