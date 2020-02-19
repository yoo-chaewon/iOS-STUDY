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


let contact = Contact(person: [Contact.Person(id: "1", name: "chaewon", email: "ohwow5@naver.com", address: "seoul", gender: "female", phone: Contact.Person.phone(mobile: "010-4277-6232", home: "031", office: "02"))])

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

do{
    let josnData = try encoder.encode(contact) //json문자열을 바이터리 형태로.
    if let jsonStr = String(data: josnData, encoding: .utf8){
        print(jsonStr)
    }
}catch{
    print(error)
}

encoder.keyEncodingStrategy = .convertToSnakeCase

do{
    let josnData = try encoder.encode(contact) //json문자열을 바이터리 형태로.
    if let jsonStr = String(data: josnData, encoding: .utf8){
        print(jsonStr)
    }
}catch{
    print(error)
}

