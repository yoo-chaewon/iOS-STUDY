import UIKit

var num1 : Int? = 20
var num2 : Int = 10

//optional Unwrapping
if num1 != nil{
    let sum = num1! + num2
    print(sum)
}

//Optional Binding
if let tmpNum1 = num1{
    let sum = tmpNum1 + num2
    print(sum)
}



class A{
    var b : B?
}

class B{
    var c: String?
}

var a: A = A()
if ((a.b?.c) != nil){
    
}
