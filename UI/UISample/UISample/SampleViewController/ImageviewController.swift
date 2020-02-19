//
//  ImageviewController.swift
//  UISample
//
//  Created by yoo chae won on 2020/02/19.
//  Copyright © 2020 yoo chae won. All rights reserved.
//

import Foundation
import UIKit

class ImageviewController: UIViewController{
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = (0...9).compactMap{UIImage(systemName: "0\($0).circle")}
        imageView.animationImages = images
        imageView.animationDuration = 2
        imageView.animationRepeatCount = 5
        
    }
    
    @IBAction func clickStartButton(_ sender: Any) {
        imageView.startAnimating()
    }
    @IBAction func clickStopButton(_ sender: Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
        }
    }
}
