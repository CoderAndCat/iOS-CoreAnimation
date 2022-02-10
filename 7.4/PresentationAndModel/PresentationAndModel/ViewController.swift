//
//  ViewController.swift
//  PresentationAndModel
//
//  Created by 武文龙 on 2022/2/10.
//

import UIKit

class ViewController: UIViewController {

    var colorLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        colorLayer.backgroundColor = UIColor.red.cgColor

        self.view.layer.addSublayer(colorLayer)
        
        
    }


    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touc = touches.first {
            let point = touc.location(in: self.view)
            
            if let preLayer = self.colorLayer.presentation(), (preLayer.hitTest(point) != nil) {
                let red = CGFloat(arc4random()) / CGFloat(UInt32.max)
                let green = CGFloat(arc4random()) / CGFloat(UInt32.max)
                let blue = CGFloat(arc4random()) / CGFloat(UInt32.max)
                
                self.colorLayer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1).cgColor
            }else{
                CATransaction.begin()
                CATransaction.setAnimationDuration(4.0)
                self.colorLayer.position = point
                CATransaction.commit()
            }
            
        }
    }
}

