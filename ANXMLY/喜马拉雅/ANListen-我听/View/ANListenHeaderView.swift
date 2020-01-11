//
//  ANListenHeaderView.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/25.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANListenHeaderView: UIView {

    let dataArray = [("下载","下载","暂无"),("历史","历史","100"),("购物车","已购","暂无"),("喜欢","喜欢","100")]
  lazy var stakView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       //  self.backgroundColor = FooterViewColor
        creatSubView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatSubView() {
        self.addSubview(stakView)
        stakView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(0)
            make.bottom.equalTo(5)
        }
        //stakView.backgroundColor = .white
        stakView.axis = .horizontal
        stakView.spacing = 10.0
        stakView.distribution = .fillEqually
        stakView.alignment = .fill
        //stakView.alignment
        //let h = self.frame.height
      //  let w = self.frame.width/CGFloat(dataArray.count)
        for (idx,item) in dataArray.enumerated() {
            let subView = ANListenHeaderItemView()
            subView.iconView.image = UIImage.init(named: item.0)
            subView.titleLb.text = item.1
            subView.subTitleLb.text = item.2
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(btnClicked(ges:)))
            tap.name = String(idx)
            subView.addGestureRecognizer(tap)
           stakView.addArrangedSubview(subView)
        }
        
        let line = UIView()
        self.addSubview(line)
        line.backgroundColor = FooterViewColor
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.height.equalTo(5)
        }
        
        
        
    }
    
   @objc func btnClicked(ges:UIGestureRecognizer) {
        //print("btn\(btn.tag) 点击了")
    if ges.state == .ended {
        print("点击了\(ges.name ?? "")")
    }
    
    }

}
