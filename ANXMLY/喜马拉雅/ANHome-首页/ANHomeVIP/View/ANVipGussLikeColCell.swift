//
//  ANVipNewHotColCell.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/2.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANVipGussLikeColCell: UICollectionViewCell {
 
        
        lazy var imageView = UIImageView()
        lazy var titleLb = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            creatSubView()
        }
        
        func creatSubView() {
            self.addSubview(titleLb)
            titleLb.font = UIFont.systemFont(ofSize: 13.0)
            titleLb.textAlignment = .center
            titleLb.textColor = .black
            titleLb.numberOfLines = 2
            titleLb.snp.makeConstraints { (make) in
                make.left.right.equalTo(0)
                make.height.equalTo(50)
                make.bottom.equalTo(0)
            }
            
            self.addSubview(imageView)
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints { (make) in
                make.top.right.left.equalTo(0)
                make.bottom.equalTo(titleLb.snp_topMargin).offset(-5)
            }
        }
        
        
        
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        

}
