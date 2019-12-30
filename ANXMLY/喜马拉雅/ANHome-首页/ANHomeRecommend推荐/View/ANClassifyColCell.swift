//
//  ANClassifyColCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/30.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANClassifyColCell: UICollectionViewCell {
    

            lazy var iconView = UIImageView()
            lazy var titleLb = UILabel()
         
            override init(frame: CGRect) {
                super.init(frame: frame)
                creatSubView()
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 2
            }
            
            func creatSubView() {
        
                
                self.addSubview(iconView)
                iconView.contentMode = .scaleAspectFit
                iconView.snp.makeConstraints { (make) in
                    //make.top.right.left.equalTo(0)
                    make.centerY.equalTo(self.snp_centerYWithinMargins)
                    make.height.width.equalTo(25)
                    make.left.equalTo(10)
                }
                self.addSubview(titleLb)
                titleLb.textColor = .black
                titleLb.textAlignment = .left
                titleLb.font = UIFont.systemFont(ofSize: 13.0)
                titleLb.adjustsFontSizeToFitWidth = true
                titleLb.snp.makeConstraints { (make) in
                    make.left.equalTo(iconView.snp_rightMargin).offset(15)
                    make.centerY.equalTo(iconView.snp_centerYWithinMargins)
                    make.height.equalTo(35)
                    make.right.equalTo(18)
                }
                
            }
            
            

            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        
    
}
