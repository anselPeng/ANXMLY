//
//  ANIconsView.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit

class ANIconsView: UIView {
    
    var dataArray:[(String,String)]?{
        didSet{
            self.collectionView.reloadData()
        }
    }
        
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


    extension ANIconsView:UICollectionViewDataSource,UICollectionViewDelegate{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return dataArray?.count ?? 0
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANFindeItemColCell
            
            let model = dataArray![indexPath.row]
            
            cell.iconView.kf.setImage(with: URL.init(string: model.0))
           // cell.iconView.image = UIImage.init(named: model.0)
            cell.titleLb.text = model.1
            return cell
        }
        
    }

