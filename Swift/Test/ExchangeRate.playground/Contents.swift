struct Money{
    var currentRate: Double = 1100 {
        willSet{
            print("환율이 \(currentRate)에서 \(newValue)로 바뀝니다.")
        }
        didSet{
            print("환율이 \(oldValue)에서 \(currentRate)로 변경되었습니다.")
        }
    }
    var dollar: Double = 0
    var won: Double {
        get{
            print("get \(dollar*currentRate)")
            return dollar * currentRate
        }
        set{
            print("set \(dollar)")
            dollar = newValue / currentRate
        }
    }
}


var myMomey = Money()
myMomey.dollar = 10
print(myMomey.won)

myMomey.currentRate = 1200

