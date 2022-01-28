//
//  ViewController.swift
//  Transform3D
//
//  Created by 武文龙 on 2022/1/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var layerView: UIView!
    
    @IBOutlet weak var layerView2: UIView!
    
    let rocketImageName = "rocket"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 为所有在 view 中做了 3D 变换的视图 设置统一的 灭点， 让他们的 透视图 延长线都相交于容器view 的灭点上
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
        self.view.layer.sublayerTransform = perspective
        
        self.layerView.layer.borderWidth = 1
        self.layerView2.layer.borderWidth = 1
        
        
        self.layerView.layer.contents = UIImage(named: rocketImageName)?.cgImage
        self.layerView.layer.contentsGravity = .resizeAspect
        self.layerView.layer.contentsScale = UIScreen.main.scale
        
        self.layerView2.layer.contents = UIImage(named: rocketImageName)?.cgImage
        self.layerView2.layer.contentsGravity = .resizeAspect
        self.layerView2.layer.contentsScale = UIScreen.main.scale
        // 默认的 3D 旋转矩阵
        var transform = CATransform3DIdentity
        var transform2 = CATransform3DIdentity
        // 3维 旋转产生进大远小的效果 ,
//        transform.m34 = -1.0 / 500
//        transform2.m34 = -1 / 500
        
        
        
        // 延 y 轴旋转 π/4
        transform = CATransform3DRotate(transform, Double.pi/4, 0, 1, 0)
        transform2 = CATransform3DRotate(transform2, -Double.pi/4, 0, 1, 0)
        
        
        self.layerView.layer.transform = transform
        self.layerView2.layer.transform = transform2
        
        
        
        
    }


}

