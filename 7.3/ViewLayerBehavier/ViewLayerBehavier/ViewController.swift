//
//  ViewController.swift
//  ViewLayerBehavier
//
//  Created by 武文龙 on 2022/2/10.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var layerView: SomeVew!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        debugPrint("Outside: \(String(describing: self.layerView.action(for: self.layerView.layer, forKey: "backgroundColor")))")
        
        UIView.beginAnimations(nil, context: nil)
        debugPrint("Iutside: \(String(describing: self.layerView.action(for: self.layerView.layer, forKey: "backgroundColor")))")
        UIView.commitAnimations()
        
        self.layerView.layer.backgroundColor = UIColor.blue.cgColor
    }


    @IBAction func changeColor(_ sender: UIButton) {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1)
        
        let redv = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let greenv = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let bluev = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        /// 直接对 view 的layer 赋值 无隐士动画
        self.layerView.layer.backgroundColor = UIColor(red: redv, green: greenv, blue: bluev, alpha: 1).cgColor
        
        CATransaction.commit()
        
    }
    
}


class SomeVew:UIView {
    // 覆盖 UIView 的方法， 来打开 UIView layer 的隐士动画
    override func action(for layer: CALayer, forKey event: String) -> CAAction? {
        let ac = CABasicAnimation.init()
        ac.keyPath = "backgroundColor"
        ac.duration = 0.5
        
        return ac
    }
}
