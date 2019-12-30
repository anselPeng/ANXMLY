//
//  ANHomeLiveColCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/24.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANHomeLiveColCell: UICollectionViewCell {

        lazy var imageView = UIImageView()
        lazy var titleLb = UILabel()
        lazy var detailLb  = UILabel()
        lazy var tipLb = UILabel()
    lazy var palyAnimalView:ANHomePlayAnimalView = {
        let view = ANHomePlayAnimalView.init(frame:CGRect.init(x: 5, y: 75, width: 2, height: 30) )
        return view
    }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            creatSubView()
        }
        
        func creatSubView() {
            self.addSubview(detailLb)
            detailLb.numberOfLines = 2
            titleLb.textAlignment = .left
            detailLb.font = UIFont.systemFont(ofSize: 12.0)
            detailLb.textColor = UIColor.gray
            detailLb.snp.makeConstraints { (make) in
                make.left.right.bottom.equalTo(0)
                make.height.equalTo(35)
            }
            
            self.addSubview(titleLb)
            titleLb.font = UIFont.systemFont(ofSize: 13.0)
            titleLb.textAlignment = .center
            titleLb.textColor = .black
            titleLb.snp.makeConstraints { (make) in
                make.left.right.equalTo(0)
                make.height.equalTo(20)
                make.bottom.equalTo(self.detailLb.snp_topMargin).offset(-2)
            }
            
            self.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 5.0
            imageView.snp.makeConstraints { (make) in
                //make.top.right.left.equalTo(0)
                make.centerX.equalTo(self.snp_centerXWithinMargins)
                make.height.width.equalTo(100)
                make.bottom.equalTo(titleLb.snp_topMargin).offset(-10)
            }
            self.addSubview(tipLb)
            tipLb.backgroundColor = .orange
            tipLb.textColor = .white
            tipLb.textAlignment = .center
            tipLb.font = UIFont.systemFont(ofSize: 11.0)
            tipLb.layer.masksToBounds = true
            tipLb.layer.cornerRadius = 2.0
            self.tipLb.snp.makeConstraints { (make) in
                make.right.equalTo(imageView).offset(-5)
                make.bottom.equalTo(imageView).offset(-5)
                make.width.equalTo(35)
                make.height.equalTo(18)
            }
            
            self.imageView.addSubview(palyAnimalView)
            
            //palyAnimalView.backgroundColor = .black
        }
        
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    
}
