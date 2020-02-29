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
