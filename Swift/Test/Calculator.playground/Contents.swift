import UIKit

let add : (Int, Int) -> Int
add = {(a: Int, b: Int) -> Int in
    return a + b
}

let sub : (Int, Int) -> Int
sub = {(a: Int, b: Int) -> Int in
    return a-b
}

let multi: (Int, Int) -> Int
multi = {(a: Int, b: Int) -> Int in
    return a * b
}

let div: (Int, Int) -> Int
div = {(a: Int, b:Int) -> Int in
    return a / b
}

func Calculator(a: Int, b: Int, method: (Int, Int)->Int) -> Int{
    return method(a, b)
}

print(Calculator(a: 10, b: 20, method: add))
