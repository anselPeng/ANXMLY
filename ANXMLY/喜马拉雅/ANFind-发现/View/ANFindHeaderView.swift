//
//  ANFindHeaderView.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/26.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANFindHeaderView: UIView {
    
    
    var dataArray = [("电子书城","电子书城"),("全民朗读","全民朗读"),("大咖主播","大咖主播"),("活动","活动"),("直播微课","直播微课"),("听单","听单"),("游戏中心","游戏中心"),("边听边看","边听边看"),("商城","商城"),("0元购","0元购")]
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //  layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: (YYScreenWidth-40)/5 , height: 65)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 4.0
        layout.minimumLineSpacing = 4.0
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANFindeItemColCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
        
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView()  {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(-5)
        }
        self.backgroundColor = FooterViewColor
    }
    
}


extension ANFindHeaderView:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return dataArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANFindeItemColCell
        
        let model = dataArray[indexPath.row]
        
        cell.iconView.image = UIImage.init(named: model.0)
        cell.titleLb.text = model.1
        return cell
    }
    
}
