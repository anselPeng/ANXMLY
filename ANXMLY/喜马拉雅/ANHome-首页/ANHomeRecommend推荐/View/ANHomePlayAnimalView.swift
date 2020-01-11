//
//  ANHomePlayAnimalView.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/24.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANHomePlayAnimalView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatSubView() {
        let layer = CALayer.init()
        layer.frame = self.bounds
        layer.backgroundColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        layer.add(scanYanimal(), forKey: "scaleAnimation")
        
        let animalLayer = CAReplicatorLayer.init()
        animalLayer.frame = self.bounds
        animalLayer.instanceCount = 4
        animalLayer.instanceTransform = CATransform3DMakeTranslation(5, 0, 0)
        animalLayer.instanceDelay = 0.2
        animalLayer.instanceColor = DominantColor.cgColor
        animalLayer.addSublayer(layer)
        self.layer.addSublayer(animalLayer)
    }
}

extension ANHomePlayAnimalView{
   fileprivate func scanYanimal() -> CABasicAnimation {
    
    let animal = CABasicAnimation.init(keyPath: "transform.scale.y")
    animal.toValue = 0.1
    animal.fromValue = 0.4
    animal.autoreverses = true
    animal.repeatCount = MAXFLOAT
    animal.isRemovedOnCompletion = false
    return animal
    }
    
}
