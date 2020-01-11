//
//  ANImagCollCell.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/26.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANImagCollCell: UICollectionViewCell {
 
    lazy var iconView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(iconView)
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 4
        iconView.snp.remakeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
