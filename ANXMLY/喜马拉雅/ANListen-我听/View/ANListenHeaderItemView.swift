//
//  ANListenHeaderItemView.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/25.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANListenHeaderItemView: UIView {

    lazy var iconView = UIImageView()
    lazy var titleLb = UILabel()
    lazy var subTitleLb = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatSubView()  {
        self.addSubview(iconView)
        iconView.contentMode = .scaleToFill
        iconView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.width.height.equalTo(25)
            make.centerX.equalTo(self.snp_centerXWithinMargins)
        }
        
        self.addSubview(titleLb)
        titleLb.textAlignment = .center
        titleLb.textColor = .lightGray
        titleLb.font = UIFont.systemFont(ofSize: 13)
        titleLb.snp.makeConstraints { (make) in
            make.top.equalTo(iconView.snp_bottomMargin).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
           // make.centerX.equalTo(self.snp_centerXWithinMargins)
        }
        
        self.addSubview(subTitleLb)
            subTitleLb.textAlignment = .center
            subTitleLb.textColor = .lightGray
            subTitleLb.font = UIFont.systemFont(ofSize: 13)
            subTitleLb.snp.makeConstraints { (make) in
                make.top.equalTo(titleLb.snp_bottomMargin).offset(10)
                make.left.right.equalTo(0)
                make.height.equalTo(20)
            }
    }
    
    
}
