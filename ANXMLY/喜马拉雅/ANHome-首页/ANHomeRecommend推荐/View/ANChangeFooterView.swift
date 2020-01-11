//
//  ANChangeFooterView.swift
//  ANXMLY
//
//  Created by 彭安忠 on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANChangeFooterView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var spaceView:UIView = {
        let view = UIView()
        view.backgroundColor = FooterViewColor
        return view
    }()
    
    lazy var changeBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("换一批", for: .normal)
        btn.setTitleColor(.orange, for: .normal)
        btn.backgroundColor = .lightGray
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5.0
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }()
    
    func creatSubView() {
        
        self.addSubview(spaceView)
        spaceView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(10)
        }
        
        self.addSubview(changeBtn)
        changeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.bottom.equalTo(self.spaceView.snp_topMargin).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(25)
        }
    }
    

}
