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
    
    @IBOutlet weak var rotateOuterView: UIView!
    
    @IBOutlet weak var rotateInnerView: UIView!
    
    @IBOutlet weak var rotateYOuterView: UIView!
    
    @IBOutlet weak var rotateYInnerView: UIView!
    
    
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
        // 是否双面 绘制
        self.layerView.layer.isDoubleSided = false
        
        self.layerView2.layer.contents = UIImage(named: rocketImageName)?.cgImage
        self.layerView2.layer.contentsGravity = .resizeAspect
        self.layerView2.layer.contentsScale = UIScreen.main.scale
        // 是否双面 绘制
        self.layerView2.layer.isDoubleSided = false
        
        // 默认的 3D 旋转矩阵
        var transform = CATransform3DIdentity
        var transform2 = CATransform3DIdentity
        // 3维 旋转产生进大远小的效果 ,
//        transform.m34 = -1.0 / 500
//        transform2.m34 = -1 / 500
        
        
        
        // 延 y 轴旋转 π/4
        transform = CATransform3DRotate(transform, Double.pi/4, 0, 1, 0)
        transform2 = CATransform3DRotate(transform2, -(Double.pi/4), 0, 1, 0)
        
        
        self.layerView.layer.transform = transform
        self.layerView2.layer.transform = transform2
        
    
        /** 绕着 z 轴旋转 **/
        let outrotate = CATransform3DMakeRotation(Double.pi / 4, 0, 0, 1)
        self.rotateOuterView.layer.transform = outrotate
        
        let innerRotate = CATransform3DMakeRotation(-(Double.pi / 4), 0, 0, 1)
        self.rotateInnerView.layer.transform = innerRotate
        
        
        /** 绕着 y 轴旋转 双层旋转*/
        
        // 外层视图绕着 Y 轴旋转45度
        var rotateYout = CATransform3DIdentity
//        rotateYout.m34 = -1.0 / 500.0
        rotateYout = CATransform3DRotate(rotateYout, Double.pi / 4, 0, 1, 0)
        self.rotateYOuterView.layer.transform = rotateYout
        
        // 内层视图 绕着 Y 轴旋转 - 45度
        var rotateYinner = CATransform3DIdentity
        rotateYinner.m34 = -1.0 / 500.0
        rotateYinner = CATransform3DRotate(rotateYinner, -(Double.pi / 4), 0, 1, 0)
        self.rotateYInnerView.layer.transform = rotateYinner
    }


}

