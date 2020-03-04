import UIKit
// #
class Person{
    var name = "채원"
    var age = 24
}

let yoo : Person = Person()
print(yoo)
dump(yoo)

// #
var arr : Array<Int> = Array<Int>()
arr.append(1)
arr.append(100)

// #
func greetin(to friend: String, from me: String){
    print("hello\(friend) I'm\(me)")
}

var myFunc = greetin(to: from:)
myFunc("소현", "채원")



var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

//
var myName: String? = nil
var yourName: String? = "소현"

if let me = myName, let you = yourName{
    print("나\(me) 그리고 너\(you)")
}

myName = "채원"
if let me = myName, let you = yourName{
    print("나\(me) 그리고 너\(you)")
}

struct SomeStruct{
    var someProperty: String = "Property"

}

var someStructInstance : SomeStruct = SomeStruct()
func someFuction(structInstancd : SomeStruct){
    var localVar : SomeStruct = structInstancd
    localVar.someProperty = "ABC"
}
someFuction(structInstancd: someStructInstance)
print(someStructInstance.someProperty)


var someResult : (Int, Int) -> Int = {(a: Int, b: Int) -> Int in
    return a+b
    
    }
