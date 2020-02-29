import UIKit

var str: String? = "안녕하세요"

func checkStr(str: String?){
    if str?.count ?? 0 > 0 {
        print(str ?? "")
    }else {
        print("내용을 입력해 주세요")
    }
}

func checkStrGuard(str: String?){
    guard let tmp = str,
        tmp.count > 0 else {
            print("내용을 입력해 주세요")
            return
    }
    print(tmp)
}


checkStr(str: str)
checkStrGuard(str: str)

