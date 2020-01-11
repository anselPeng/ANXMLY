//
//  ANIconsTableCell.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/31.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit

class ANIconsTableCell: UITableViewCell {
    
    var dataArray: [ANVipIconItemModel]?
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: (YYScreenWidth-40)/5 , height: 65)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 4.0
        layout.minimumLineSpacing = 4.0
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANFindeItemColCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatSubView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatSubView()  {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
    
    }
    
}


extension ANIconsTableCell:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANFindeItemColCell
        
        let model = dataArray?[indexPath.row]
        
        cell.iconView.kf.setImage(with: URL.init(string: model?.coverPath ?? ""))
        cell.titleLb.text = model?.title
        return cell
    }
}
