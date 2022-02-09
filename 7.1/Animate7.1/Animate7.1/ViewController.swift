//
//  ViewController.swift
//  Animate7.1
//
//  Created by 武文龙 on 2022/2/9.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var layerView: UIView!
    
    let colorLayer = CALayer.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colorLayer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        
        self.layerView.layer.addSublayer(colorLayer)
    }

    @IBAction func changeColor(_ sender: UIButton) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        
        
        let redValue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let greenValue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blueValue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        // 改变颜色时会默认带隐士动画， 动画执行时间取决于当前事务的设置，动画类型取决于图层行为
        self.colorLayer.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1).cgColor
        
        CATransaction.commit()
    }
    
}

