//
//  BottomView.swift
//  CustomBottomSheet
//
//  Created by yoo chae won on 2020/03/05.
//  Copyright © 2020 yoo chae won. All rights reserved.
//

import UIKit

class BottomView: UIView {
    var title : String?
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func Cancel(_ sender: Any) {
        self.closeAni()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.addSubview(viewBackground)
        self.addSubview(viewAddFrame)
    }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
        }
        
      
        
        var moveRange : CGFloat = 0
        
        var viewAddFrameSaveRect : CGRect = .zero
        
        func initView(SheetHeight height:CGFloat, Parent pView:UIViewController)
        {
            moveRange = height
    //        self.viewAddFrame.backgroundColor = UIColor.red
            self.viewBackground.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            backgroundColor = UIColor.clear
            
    //        self.topAnchor.constraint(equalTo: pView.topLayoutGuide.bottomAnchor).isActive = true
    //        self.bottomAnchor.constraint(equalTo: pView.bottomLayoutGuide.topAnchor).isActive = true
    //        self.leadingAnchor.constraint(equalTo: pView.view.leadingAnchor).isActive = true
    //        self.trailingAnchor.constraint(equalTo: pView.view.trailingAnchor).isActive = true
    //
            let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
            self.viewBackground.addGestureRecognizer(gesture)
            
            
            
            
            self.isHidden = true
            self.viewAddFrame.layoutIfNeeded()
          
        }

    
    @objc func openAni()
    {
        self.isHidden = false
        var bottomSaveHeight : CGFloat = 0.0
        if #available(iOS 11.0, *) {
            bottomSaveHeight =  self.superview?.safeAreaInsets.bottom ?? 0.0
        }
        
        self.frame = CGRect(x: 0, y: self.frame.size.height - bottomSaveHeight , width: self.frame.size.width, height: 200)
        self.alpha = 0
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.frame.origin.y -= 200
            self.alpha = 1
        }, completion: { (finished: Bool) in
            
        })
    }
    @objc func closeAni()
    {
        var bottomSaveHeight : CGFloat = 0.0
        if #available(iOS 11.0, *) {
            bottomSaveHeight =  self.superview?.safeAreaInsets.bottom ?? 0.0
        }
        self.frame = CGRect(x: 0, y: self.frame.size.height - bottomSaveHeight - 200 , width: self.frame.size.width, height: 200)
        
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.alpha = 1
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
            self.frame.origin.y += 200
            self.alpha = 0
        }, completion: { (finished: Bool) in
            if(finished){
                self.isHidden = true
            }
        })
    }
}

extension BottomView : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}


