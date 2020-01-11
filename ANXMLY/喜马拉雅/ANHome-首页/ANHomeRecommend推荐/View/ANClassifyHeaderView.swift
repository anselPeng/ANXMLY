//
//  ANClassifyHeaderView.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/30.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANClassifyHeaderView: UICollectionReusableView {
        
    lazy var lineView = UIView()
    lazy var titlb = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView()  {
        self.addSubview(lineView)
        lineView.backgroundColor = .red
        lineView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp_centerYWithinMargins)
            make.left.equalTo(15)
            make.width.equalTo(4)
            make.height.equalTo(30)
        }
        
        self.addSubview(titlb)
        titlb.font = UIFont.systemFont(ofSize: 15)
        titlb.textColor = .gray
        titlb.snp.makeConstraints { (make) in
            make.left.equalTo(lineView.snp_rightMargin).offset(10)
            make.right.top.bottom.equalTo(0)
            
        }
        
        
    }
    
    
}
