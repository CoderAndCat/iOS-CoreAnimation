//
//  ViewController.swift
//  CubeFace
//
//  Created by 武文龙 on 2022/2/9.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var containerView: UIView!
    
    
    @IBOutlet var faces: [UIView]!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / 500.0
//        perspective = CATransform3DRotate(perspective, -(Double.pi/4), 1, 0, 0)
//        perspective = CATransform3DRotate(perspective, -(Double.pi/4), 0, 1, 0)
        self.containerView.layer.sublayerTransform = perspective
        
        var  transform = CATransform3DMakeTranslation(0, 0, 100)
        self.addFace(index: 0, withTransform: transform)
        
        transform = CATransform3DMakeTranslation(100, 0, 0)
        transform = CATransform3DRotate(transform, Double.pi/2, 0, 1, 0)
        self.addFace(index: 1, withTransform: transform)
        
        transform = CATransform3DMakeTranslation(0, -100, 0)
        transform = CATransform3DRotate(transform, Double.pi/2, 1, 0, 0)
        self.addFace(index: 2, withTransform: transform)
        
        transform = CATransform3DMakeTranslation(0, 100, 0)
        transform = CATransform3DRotate(transform, -(Double.pi/2), 1, 0, 0)
        self.addFace(index: 3, withTransform: transform)
        
        transform = CATransform3DMakeTranslation(-100, 0, 0)
        transform = CATransform3DRotate(transform, -(Double.pi/2), 0, 1, 0)
        self.addFace(index: 4, withTransform: transform)
        
        transform = CATransform3DMakeTranslation(0, 0, -100)
        transform = CATransform3DRotate(transform, Double.pi, 0, 1, 0)
        self.addFace(index: 5, withTransform: transform)
        
    }
    
    func addFace(index: Int, withTransform: CATransform3D) {
        
        let face = self.faces[index]
        face.removeFromSuperview()
        self.containerView.addSubview(face)
        face.layer.borderWidth = 1.0
        
        let containeSize = self.containerView.bounds.size
        face.center = CGPoint(x: containeSize.width / 2, y: containeSize.height / 2)
        face.layer.transform = withTransform
    }


}

