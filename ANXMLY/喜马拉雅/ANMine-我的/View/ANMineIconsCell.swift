//
//  ANMineIconsCell.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/17.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit

class ANMineIconsCell: UITableViewCell {
    
    
    var dataArray:[ANIconTitleModel]?{
        
        didSet{
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init( style: style, reuseIdentifier: reuseIdentifier)
        creatSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func creatSubView() {
        
        self .addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    lazy var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: (YYScreenWidth - 20 )/4.0, height: 80)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: -10)
        layout.minimumInteritemSpacing = 0.0001
        layout.minimumLineSpacing = 0.00001
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANIconTitleCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension ANMineIconsCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANIconTitleCell
        
        let model = dataArray?[indexPath.row]
        
        cell.icon.image = UIImage.init(named:model!.iconStr)
        cell.titleLb.text = model!.titleStr
        if indexPath.row == 0 {
            
            //let x = (YYScreenWidth - 20 )/8.0
            
            let animationView = ANMineMicAnimalView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
            cell.addSubview(animationView)
            animationView.snp.makeConstraints { (make) in
                make.centerX.equalTo(cell.snp_centerXWithinMargins)
                make.centerY.equalTo(30)
                make.width.height.equalTo(50)
            }
            animationView.startAnimation()
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(" 我要录音点击了 ")
    }
    
    
    
    
}
