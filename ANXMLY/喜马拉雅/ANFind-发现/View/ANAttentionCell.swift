//
//  ANAttentionCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/26.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANAttentionCell: UITableViewCell {
    
    lazy var iconView = UIImageView()
    lazy var namelb = UILabel()
    lazy var contentLb = UILabel()
    lazy var timeLb = UILabel()
    lazy var goodImg = UIImageView()
    lazy var goodLb = UILabel()
    lazy var commentImg = UIImageView()
    lazy var commentLb = UILabel()
    
    var model:ANFindAttentionModel?{
        didSet{
            guard let item = model else {return}
            iconView.kf.setImage(with: URL.init(string: item.authorInfo!.avatarUrl!))
            namelb.text = item.authorInfo?.nickname!
            let text = item.contentInfo?.text
            self.contentLb.text =  text
            self.contentLb.snp.updateConstraints { (make) in
                make.height.equalTo(contentTextHeight(text: text ?? ""))
            }
            collectionView.reloadData()
            timeLb.text = String().updateTimeToCurrennTime(timeStamp:item.timeline ?? 0)
            goodLb.text = String().stringFromPowerInt(count: item.statInfo?.praiseCount ?? 0)
             commentLb.text = String().stringFromPowerInt(count: item.statInfo?.commentCount ?? 0)
            
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
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //  layout.scrollDirection = .horizontal
        
        let w = itemHeight()
        layout.itemSize = CGSize.init(width: w-5, height: w-5)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 4.0
        layout.minimumLineSpacing = 4.0
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANImagCollCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
        
    }()
    
    func creatSubView()  {
        self.contentView.addSubview(iconView)
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 17
        iconView.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.width.height.equalTo(34)
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
        
        self.contentView.addSubview(contentLb)
        contentLb.font = UIFont.systemFont(ofSize: 15)
        contentLb.textColor = .black
        contentLb.numberOfLines = 0
        contentLb.snp.makeConstraints { (make) in
            make.top.equalTo(namelb.snp_bottomMargin).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(contentLb.snp_bottomMargin).offset(5)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-45)
        }
        
        self.contentView.addSubview(timeLb)
        timeLb.textColor = .lightGray
        timeLb.font = UIFont.systemFont(ofSize: 12)
        timeLb.adjustsFontSizeToFitWidth = true
        self.timeLb.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.bottom.equalTo(-10)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        self.contentView.addSubview(commentLb)
        commentLb.font = UIFont.systemFont(ofSize: 13)
        commentLb.textColor = .lightGray
        commentLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeLb.snp_centerYWithinMargins)
            make.right.equalTo(-10)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(commentImg)
        commentImg.image = UIImage.init(named: "评论")
        commentImg.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(timeLb.snp_centerYWithinMargins)
            make.right.equalTo(commentLb.snp_leftMargin).offset(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
            
        }
        
        self.contentView.addSubview(goodLb)
        goodLb.font = UIFont.systemFont(ofSize: 13)
        goodLb.textColor = .lightGray
        goodLb.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeLb.snp_centerYWithinMargins)
            make.right.equalTo(commentImg.snp_leftMargin).offset(-5)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        self.contentView.addSubview(goodImg)
        goodImg.image = UIImage.init(named: "点赞")
        goodImg.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeLb.snp_centerYWithinMargins)
            make.right.equalTo(goodLb.snp_leftMargin).offset(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
            
        }
        
        
        
        
    }
    
    
    func cellHeight(model:ANFindAttentionModel) -> CGFloat {
        var result:CGFloat = 0.0
        
        let text = model.contentInfo?.text
        
        result += contentTextHeight(text:text ?? "")
        result += collectionHeight(model: model)
        
        result += 95
        return result
    }
    
    
    
    
    func collectionHeight(model:ANFindAttentionModel) -> CGFloat {
        
        let count = model.contentInfo?.picInfos?.count ?? 0
        var  lines = (count-1)/3 + 1
         if lines > 3 {
             lines = 3
         }
         if count == 0 {
             lines = 0
         }
        let itemH = itemHeight()
         
         return CGFloat(lines) * itemH + 20
        
        
    }
    
    func itemHeight() -> CGFloat{
        return (YYScreenWidth - 20)/3.0 - 5.0
    }
    
    func contentTextHeight(text:String) -> CGFloat{
        
        var height:CGFloat  = 30.0
        guard text.lengthOfBytes(using: .utf8) > 0 else {
            return height
        }
        let lb = UILabel()
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.numberOfLines = 0
        lb.text = text
        height += lb.sizeThatFits(CGSize.init(width: YYScreenWidth - 30, height: CGFloat.infinity)).height
        return height
        
    }
    
    
}


extension ANAttentionCell:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model?.contentInfo?.picInfos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANImagCollCell
        let item = model?.contentInfo?.picInfos![indexPath.row]
        cell.iconView.kf.setImage(with: URL.init(string:item!.squareUrl! ))
        return cell
    }
    
    
    
}

