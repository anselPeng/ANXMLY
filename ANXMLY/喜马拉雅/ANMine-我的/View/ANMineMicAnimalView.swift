//
//  ANMineMicAnimalView.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/18.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANMineMicAnimalView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pulseLayer:CAShapeLayer = {
       let layer = CAShapeLayer()
        layer.backgroundColor = UIColor.clear.cgColor
        layer.fillColor = UIColor.init(red: 213.0/255.0, green: 55.0/255.0, blue: 12.0/255.0, alpha: 1).cgColor
        return layer
    }()
    
    func creatSubView() {
        let width = self.bounds.width
        pulseLayer.bounds = CGRect.init(x: 0, y: 0, width: width, height: width)
        pulseLayer.position = CGPoint.init(x: width/2.0, y: width/2.0)
        pulseLayer.path = UIBezierPath.init(ovalIn: pulseLayer.bounds).cgPath
        pulseLayer.opacity = 0.0
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.bounds = CGRect.init(x: 0, y: 0, width: width, height: width)
        replicatorLayer.position = CGPoint.init(x: width/2.0, y: width/2.0)
        replicatorLayer.instanceCount = 3
        replicatorLayer.instanceDelay = 1
        replicatorLayer.addSublayer(pulseLayer)
        self.layer.addSublayer(replicatorLayer)
        self.layer.insertSublayer(replicatorLayer, at: 0)
        
    }
    
    func startAnimation() {
        let opacityAnimation = CABasicAnimation.init(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = 0.0
        
        let scaleAnimation = CABasicAnimation.init(keyPath: "transform")
        let t = CATransform3DIdentity
        scaleAnimation.fromValue = NSValue.init(caTransform3D: CATransform3DScale(t, 0.0, 0.0, 0.0))
        scaleAnimation.toValue = NSValue.init(caTransform3D: CATransform3DScale(t, 1.0, 1.0, 0))
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [opacityAnimation,scaleAnimation]
        animationGroup.duration = 3
        animationGroup.autoreverses = false
        animationGroup.repeatCount = HUGE
        animationGroup.isRemovedOnCompletion = false
        pulseLayer.add(animationGroup, forKey: nil)
        
    }
    
    
}
