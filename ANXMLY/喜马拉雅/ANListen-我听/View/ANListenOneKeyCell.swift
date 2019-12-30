//
//  ANListenOneKeyCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/25.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import JXMarqueeView

class ANListenOneKeyCell: UITableViewCell {
       lazy var picView = UIImageView()
       lazy var titleLb = UILabel()
       lazy var scrollLb = UILabel()
       lazy var playBtn = UIButton()
       lazy var marqueeView = JXMarqueeView()
       override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           
           // Configure the view for the selected state
       }
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           creatSubView()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func creatSubView() {
           self.contentView.addSubview(picView)
           picView.contentMode = .scaleAspectFill
           picView.layer.masksToBounds  = true
           picView.layer.cornerRadius = 4
           picView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(0)
           }
           
           self.contentView.addSubview(titleLb)
           titleLb.textColor = .white
           titleLb.font = UIFont.systemFont(ofSize: 20)
           titleLb.snp.makeConstraints { (make) in
               make.left.equalTo(picView.snp_leftMargin).offset(15)
               make.right.equalTo(0)
                make.top.equalTo(picView.snp_topMargin).offset(15)
               make.height.equalTo(30)
           }
          
        self.contentView.addSubview(marqueeView)
        marqueeView.contentView = self.scrollLb
        marqueeView.contentMargin = 10.0
        marqueeView.marqueeType = .reverse
           scrollLb.textColor = .white
           scrollLb.font = UIFont.systemFont(ofSize: 15)
           marqueeView.snp.makeConstraints { (make) in
               make.left.equalTo(titleLb.snp_leftMargin)
               make.right.equalTo(-60)
                make.top.equalTo(titleLb.snp_bottomMargin).offset(10)
               make.height.equalTo(30)
           }
           
           self.contentView.addSubview(playBtn)
            playBtn.setImage(UIImage.init(named: "whitePlay"), for: .normal)
            playBtn.snp.makeConstraints { (make) in
                make.right.equalTo(picView.snp_rightMargin).offset(-10)
                make.height.width.equalTo(40)
                make.centerY.equalTo(marqueeView.snp_centerYWithinMargins)
           }
           
       }

}
