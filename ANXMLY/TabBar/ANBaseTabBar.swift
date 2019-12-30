//
//  ANBaseTabBar.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit
import ESTabBarController_swift
class ANBaseTabBar: ESTabBarItemContentView {
    
    var duratuin  = 0.3
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
       // textColor = .black
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        
        
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
            highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
            iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
            highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }


    func bounceAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        animation.values = [1.0,1.4,0.9,0.95,1.2,1.0]
        animation.duration = duratuin * 2
        animation.calculationMode = .cubic

        imageView.layer.add(animation, forKey: nil)

    }
    
    
    
}
