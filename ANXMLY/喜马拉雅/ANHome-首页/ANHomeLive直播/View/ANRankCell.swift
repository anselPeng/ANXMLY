//
//  ANRankCell.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/9.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit
import FSPagerView
class ANRankCell: FSPagerViewCell {
   lazy var titleLb = UILabel()
   lazy var img1 = UIImageView()
    lazy var img2 = UIImageView()
    lazy var img3 = UIImageView()
    lazy var imgArrow = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func creatSubView() {
        self.addSubview(titleLb)
        titleLb.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.width.equalTo(150)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        self.addSubview(imgArrow)
        imgArrow.contentMode = .scaleAspectFit
        imgArrow.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        self.addSubview(img3)
        img3.layer.masksToBounds = true
        img3.layer.cornerRadius = 15
        img3.snp.makeConstraints { (make) in
            make.right.equalTo(imgArrow.snp_leftMargin).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        self.addSubview(img2)
        img2.layer.masksToBounds = true
        img2.layer.cornerRadius = 15
        img2.snp.makeConstraints { (make) in
            make.right.equalTo(img3.snp_leftMargin).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        self.addSubview(img1)
        img1.layer.masksToBounds = true
        img1.layer.cornerRadius = 15
        img1.snp.makeConstraints { (make) in
            make.right.equalTo(img2.snp_leftMargin).offset(-10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
    }
    
}
