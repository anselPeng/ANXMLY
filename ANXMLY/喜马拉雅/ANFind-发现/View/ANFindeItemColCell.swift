//
//  ANFindeItemColCell.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/26.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANFindeItemColCell: UICollectionViewCell {
    lazy var iconView = UIImageView()
    lazy var titleLb = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView()  {
        
        self.addSubview(iconView)
        iconView.contentMode = .scaleAspectFit
        iconView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.top.equalTo(5)
            make.width.height.equalTo(30)
        }
        
        self.addSubview(titleLb)
        titleLb.textAlignment = .center
        titleLb.textColor  = .black
        titleLb.font = UIFont.systemFont(ofSize: 13)
        titleLb.snp.makeConstraints { (make) in
             make.centerX.equalTo(self.snp_centerXWithinMargins)
                make.bottom.equalTo(-5)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
        
    }
    
    
}
