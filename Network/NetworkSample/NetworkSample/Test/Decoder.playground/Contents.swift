import UIKit

struct Contact : Codable{
    struct Person : Codable{
        var id: String
        var name: String
        var email: String
        var address: String
        var gender: String
        struct phone : Codable{
            var mobile: String
            var home: String
            var office: String
        }
        let phone: phone
    }
    
    let person : [Person]
}

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
