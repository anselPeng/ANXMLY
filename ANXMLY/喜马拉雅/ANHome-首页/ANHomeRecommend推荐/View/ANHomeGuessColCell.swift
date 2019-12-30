//
//  ANHomeGuessColCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/20.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANHomeGuessColCell: UICollectionViewCell {
    
    lazy var imageView = UIImageView()
    lazy var titleLb = UILabel()
    lazy var detailLb  = UILabel()
    
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
            make.height.equalTo(40)
        }
        
        self.addSubview(titleLb)
        titleLb.font = UIFont.systemFont(ofSize: 13.0)
        titleLb.textAlignment = .center
        titleLb.textColor = .black
        titleLb.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(30)
            make.bottom.equalTo(self.detailLb.snp_topMargin).offset(-2)
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
