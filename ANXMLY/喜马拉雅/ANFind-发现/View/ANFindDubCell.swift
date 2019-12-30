//
//  ANFindDubCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/28.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit


typealias ANFindDubCellHeightChange = ()->(Void)

class ANFindDubCell: UITableViewCell {
    lazy  var picView = UIImageView()
    lazy var iconView = UIImageView()
    lazy var namelb = UILabel()
    lazy var titleLb = UILabel()
    lazy var goodImg = UIImageView()
    lazy var goodLb = UILabel()
    lazy var commentImg = UIImageView()
    lazy var commentLb = UILabel()
    var cellHeightChange:ANFindDubCellHeightChange?
    
    
    var model:ANFindDubModel?{
        didSet{
            guard let item = model else {return}
            
            let  dubItem  = item.dubbingItem
            titleLb.text = dubItem?.title
            let url = URL.init(string: dubItem!.coverMiddle!)
            picView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                
                let size = self.picView.image?.size
                guard let s = size else { return }
                
                let h = (YYScreenWidth - 30)*s.height/s.width + 60
                if item.height != h{
                    item.height = h
                    if self.cellHeightChange != nil {
                        self.cellHeightChange!()
                    }
                }
                
            }
            
            iconView.kf.setImage(with: URL.init(string: (dubItem?.logoPic!)!))
            namelb.text = dubItem?.nickname!
            
            goodLb.text = String().stringFromPowerInt(count: dubItem?.favorites ?? 0)
            commentLb.text = String().stringFromPowerInt(count: dubItem!.commentCount ?? 0)
            
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatSubView()
        self.backgroundColor = .white
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func creatSubView()  {
        
        self.contentView.addSubview(picView)
        picView.layer.masksToBounds = true
        picView.layer.cornerRadius = 4
        picView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.equalTo(-15)
            make.bottom.equalTo(-50)
        }
        self.contentView.addSubview(titleLb)
        titleLb.font = UIFont.systemFont(ofSize: 17)
        titleLb.textColor = .white
        titleLb.snp.makeConstraints { (make) in
            make.left.equalTo(picView.snp_leftMargin).offset(15)
            make.top.equalTo(picView.snp_topMargin).offset(15)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(iconView)
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 17
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.width.height.equalTo(34)
            make.bottom.equalTo(-10)
        }
        
        self.contentView.addSubview(namelb)
        namelb.textColor = .black
        namelb.font = UIFont.systemFont(ofSize: 15)
        namelb.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp_rightMargin).offset(10)
            make.centerY.equalTo(iconView.snp_centerYWithinMargins)
            make.right.equalTo(0)
            make.height.equalTo(30)
        }
        
        
        
        self.contentView.addSubview(commentLb)
        commentLb.font = UIFont.systemFont(ofSize: 13)
        commentLb.textColor = .lightGray
        commentLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconView.snp_centerYWithinMargins)
            make.right.equalTo(-10)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(commentImg)
        commentImg.image = UIImage.init(named: "评论")
        commentImg.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(iconView.snp_centerYWithinMargins)
            make.right.equalTo(commentLb.snp_leftMargin).offset(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
            
        }
        
        self.contentView.addSubview(goodLb)
        goodLb.font = UIFont.systemFont(ofSize: 13)
        goodLb.textColor = .lightGray
        goodLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconView.snp_centerYWithinMargins)
            make.right.equalTo(commentImg.snp_leftMargin).offset(-5)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(goodImg)
        goodImg.image = UIImage.init(named: "点赞")
        goodImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(iconView.snp_centerYWithinMargins)
            make.right.equalTo(goodLb.snp_leftMargin).offset(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
            
        }
    }
    
}


