//
//  ANLikeHeader.swift
//  ANXMLY
//
//  Created by 彭安忠 on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANLikeHeader: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        creatSubView()
      //  self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    lazy var textLb:UILabel = {
        let lb = UILabel()
        lb.text  = "猜你喜欢"
        return lb
    }()
    
    lazy var moreBtn:UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textAlignment = .right
        btn.setTitle("更多 >", for: .normal)
        btn.setTitleColor(.lightGray, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(moreBtnClicked(btn:)), for: .touchUpOutside)
        return btn
    }()
    
    func creatSubView()  {
        self.addSubview(textLb)
        textLb.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
            make.right.equalTo(0)
            make.height.equalTo(40)
        }
        
        self.addSubview(moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp_rightMargin).offset(-5)
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
    }
    
    @objc func moreBtnClicked(btn:UIButton)  {
        
        print("更多点击了")
    }
}
