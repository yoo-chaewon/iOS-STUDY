//
//  UIViewController+Alert.swift
//  LocationTest
//
//  Created by yoo chae won on 2020/05/13.
//  Copyright © 2020 yoo chae won. All rights reserved.
//

import UIKit

extension UIViewController{
    func show(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
}
