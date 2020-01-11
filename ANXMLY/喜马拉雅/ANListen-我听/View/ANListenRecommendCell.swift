//
//  ANListenRecommendCell.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/25.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANListenRecommendCell: UITableViewCell {
    
    lazy var imgView = UIImageView()
    lazy var titleLb = UILabel()
    lazy var detailLb = UILabel()
    lazy var playImageView = UIImageView()
    lazy var playLb = UILabel()
    lazy var sectionImageView = UIImageView()
    lazy var sectionLb = UILabel()
    
    
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
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView() {
        self.contentView .addSubview(self.imgView)
        self.imgView.contentMode = .scaleAspectFit
              imgView.layer.masksToBounds  = true
              imgView.layer.cornerRadius = 2
        self.imgView.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
            make.left.equalTo(12)
        }

        self.contentView .addSubview(self.titleLb)
        titleLb.font = UIFont.systemFont(ofSize: 14.0)
        titleLb.textAlignment = .left
        titleLb.textColor = .black
        self.titleLb.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.right.equalTo(self.snp_rightMargin).offset(-15)
            make.top.equalTo(self.imgView.snp_topMargin)
            make.left.equalTo(self.imgView.snp_rightMargin).offset(10)
        }
        
        self.contentView .addSubview(self.detailLb)
        detailLb.font = UIFont.systemFont(ofSize: 13.0)
        detailLb.textAlignment = .left
        detailLb.textColor = .lightGray
        detailLb.numberOfLines = 2
        self.detailLb.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.right.equalTo(self.snp_rightMargin).offset(-15)
            make.left.equalTo(self.imgView.snp_rightMargin).offset(10)
            make.centerY.equalTo(self.snp_centerYWithinMargins)
        }
        self.contentView .addSubview(self.playImageView)
        self.playImageView.contentMode = .scaleAspectFit
        self.playImageView.image = UIImage.init(named: "playcount")
        self.playImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(14)
            make.bottom.equalTo(self.imgView.snp_bottomMargin).offset(0)
            make.left.equalTo(self.titleLb.snp_leftMargin)
        }
        
        
        self.contentView .addSubview(self.playLb)
        playLb.font = UIFont.systemFont(ofSize: 13.0)
        playLb.textAlignment = .left
        playLb.textColor = .lightGray
        self.playLb.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.width.equalTo(100)
            make.centerY.equalTo(self.playImageView.snp_centerYWithinMargins)
            make.left.equalTo(self.playImageView.snp_rightMargin).offset(8)
        }
        
        self.contentView .addSubview(self.sectionImageView)
        self.sectionImageView.contentMode = .scaleAspectFit
        self.sectionImageView.image = UIImage.init(named: "track")
        self.sectionImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(14)
            make.centerY.equalTo(self.playImageView.snp_centerYWithinMargins)
            make.left.equalTo(self.playLb.snp_rightMargin).offset(10)
        }
        self.contentView .addSubview(self.sectionLb)
        sectionLb.font = UIFont.systemFont(ofSize: 13.0)
        sectionLb.textAlignment = .left
        sectionLb.textColor = .lightGray
        self.sectionLb.snp.makeConstraints { (make) in
            make.height.equalTo(16)
            make.width.equalTo(80)
            make.centerY.equalTo(self.playImageView.snp_centerYWithinMargins)
            make.left.equalTo(self.sectionImageView.snp_rightMargin).offset(8)
        }
    }
    
    
    
}
