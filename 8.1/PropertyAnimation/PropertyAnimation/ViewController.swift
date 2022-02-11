//
//  ViewController.swift
//  PropertyAnimation
//
//  Created by 武文龙 on 2022/2/11.
//

import UIKit

class ViewController: UIViewController {

    let colorLayer = CALayer()
    var colorToValue = UIColor.yellow.cgColor
    
    @IBOutlet weak var layerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0)
        colorLayer.backgroundColor = UIColor.blue.cgColor
        
        self.layerView.layer.addSublayer(colorLayer)
        
    }

    @IBAction func changeColor(_ sender: UIButton) {
        
        let red = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        
        let coolr = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.colorToValue = coolr.cgColor
        let anima = CABasicAnimation.init()
        anima.keyPath = "backgroundColor"
        anima.toValue = coolr.cgColor
        anima.delegate = self
        anima.duration = 2
        
        self.colorLayer.add(anima, forKey: nil)
        
    }
    
    
}

extension ViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {        
            debugPrint("----- 动画完成----")
            CATransaction.begin()
            CATransaction.setDisableActions(true)
            self.colorLayer.backgroundColor = self.colorToValue
            
            CATransaction.commit()
        }
    }
    
}
