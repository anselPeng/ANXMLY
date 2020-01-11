//
//  ANMineVipView.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANMineVipView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
        self.backgroundColor = UIColor.init(red: 212.0/255.0, green: 212.0/255.0, blue: 212.0/255.0, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        creatSubView()
    }
    private lazy var icon:UIImageView  = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage.init(named: "vip")
        return icon
    }()

    private lazy var vipLb:UILabel = {
        let lb = UILabel()
        lb.text = "VIP会员"
        lb.textColor = .gray
        lb.font = UIFont.systemFont(ofSize: 15)
        return lb
    }()
    
    private lazy var freeVipLb:UILabel = {
           let lb = UILabel()
           lb.text = "免费领取7天会员"
           lb.textColor = .gray
        lb.font = UIFont.systemFont(ofSize: 11)
        lb.textAlignment = .center
           return lb
       }()
    private lazy var arrowLb:UILabel = {
              let lb = UILabel()
              lb.text = ">"
              lb.textColor = .gray
        lb.font = UIFont.systemFont(ofSize: 17)
        lb.textAlignment = .right
              return lb
          }()
    
    
    func creatSubView(){
        self.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.left.top.equalTo(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        self.addSubview(vipLb)
        vipLb.snp.makeConstraints { (make) in
            make.left.equalTo(icon.snp_rightMargin).offset(5)
            make.top.equalTo(10)
            make.width.equalTo(80)
            make.height.equalTo(18)
        }
        
        self.addSubview(freeVipLb)
             freeVipLb.snp.makeConstraints { (make) in
                 make.left.equalTo(0)
                 make.right.equalTo(0)
                 make.bottom.equalTo(-8)
                 make.height.equalTo(18)
             }
        self.addSubview(arrowLb)
             arrowLb.snp.makeConstraints { (make) in
                 make.right.equalTo(self.snp_rightMargin).offset(5)
                make.centerY.equalTo(self.snp_centerYWithinMargins)
                 make.width.equalTo(20)
                 make.height.equalTo(30)
             }
        
    }
    
}
