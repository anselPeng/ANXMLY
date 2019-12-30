//
//  ANIconTitleCell.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/17.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit

class ANIconTitleCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatSubView() {
        self.addSubview(icon)
        icon.snp.makeConstraints { (make) in
               make.left.top.equalTo(15)
               make.right.equalTo(-15)
               make.height.equalTo(40)
           }
        self.addSubview(titleLb)
        titleLb.snp.makeConstraints { (make) in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.top.equalTo(icon.snp_bottomMargin).offset(10)
                make.height.equalTo(20)
            }
    }
    
    lazy var icon:UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .center;
        return icon
    }()
    
    lazy var titleLb:UILabel = {
        let lb = UILabel()
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 13.0)
        return lb
    }()
    
    
    
}
