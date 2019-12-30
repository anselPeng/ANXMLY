//
//  ANHomeLiveTableCell.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/24.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANHomeLiveTableCell: UITableViewCell {
    
    
    var dataArray:[LiveModel]?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //  layout.scrollDirection = .horizontal
        layout.itemSize = CGSize.init(width: (YYScreenWidth - 40 )/3.0, height: 160)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANHomeLiveColCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        return collectionView
        
    }()
    
    
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
    
    func creatSubView()  {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
}


extension ANHomeLiveTableCell:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.dataArray?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANHomeLiveColCell
        let model = dataArray?[indexPath.row]
        cell.imageView.kf.setImage(with: URL.init(string: model?.coverMiddle ?? ""))
        cell.titleLb.text = model?.nickname
        cell.detailLb.text = model?.description
        cell.tipLb.text = model?.categoryName
       // cell.backgroundColor = .red
      // cell
        return cell
    }
    
}
