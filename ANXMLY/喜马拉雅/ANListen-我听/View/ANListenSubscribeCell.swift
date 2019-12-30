//
//  ANListenSubscribeCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/25.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANListenSubscribeCell: UITableViewCell {
    
    lazy var iconView = UIImageView()
    lazy var titleLb = UILabel()
    lazy var detailLb = UILabel()
    lazy var timeLb = UILabel()
    
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
        
        self.contentView.addSubview(iconView)
        iconView.contentMode = .scaleAspectFit
        iconView.layer.masksToBounds  = true
        iconView.layer.cornerRadius = 2
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.height.width.equalTo(80)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        
        self.contentView.addSubview(titleLb)
        titleLb.textColor = .black
        titleLb.font = UIFont.systemFont(ofSize: 15)
        titleLb.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp_rightMargin).offset(10)
            make.right.equalTo(0)
            make.top.equalTo(iconView.snp_topMargin)
            make.height.equalTo(20)
        }
        
        self.contentView.addSubview(detailLb)
        detailLb.textColor = .lightGray
        detailLb.font = UIFont.systemFont(ofSize: 13)
        detailLb.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp_rightMargin).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(20)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        
        self.contentView.addSubview(timeLb)
        timeLb.textColor = .lightGray
        timeLb.font = UIFont.systemFont(ofSize: 13)
        timeLb.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp_rightMargin).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(20)
            make.bottom.equalTo(iconView.snp_bottomMargin)
        }
        
    }
    
}
