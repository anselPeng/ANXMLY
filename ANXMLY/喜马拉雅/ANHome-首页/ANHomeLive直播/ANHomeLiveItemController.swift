//
//  ANHomeLiveItenController.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit
import LTScrollView
import HandyJSON
import SwiftyJSON
class ANHomeLiveItemController: UIViewController {

    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        creatSubView()
       // loadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData() {
        
        
        /*
         "timeToPreventCaching": 1578712651,
          "sign": 1,
          "pageId": 1,
          "categoryType": 13,
          "pageSize": 20
         */
            let param = ["pageId":1,"pageSize":20,"categoryType":self.id,"sign":1,"timeToPreventCaching":Int32(Date().timeIntervalSince1970)] as [String:Any]
            // param = appendBaseParamaters(parameters: param)
             NetWorkRequest(.getHomeLiveItemList(parameters: param)) { (result) -> (Void) in
                 let json = JSON.init(parseJSON: result)
                 let array = JSONDeserializer<LiveModel>.deserializeModelArrayFrom(json: json["data"]["lives"].description) as! [LiveModel]
                  self.dataArray = array
             
             }
             
    }
    
    
    var dataArray:[LiveModel]?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: (YYScreenWidth - 40 )/2.0, height: (YYScreenWidth - 40 )/2.0 + 60)
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumInteritemSpacing = 5.0
        layout.minimumLineSpacing = 5.0
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ANHomeLiveColCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        return collectionView
        
    }()
    


    func creatSubView()  {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        glt_scrollView = collectionView
        
    }
    
}


extension ANHomeLiveItemController:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.dataArray?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANHomeLiveColCell
        let model = dataArray?[indexPath.row]
        cell.imageView.kf.setImage(with: URL.init(string: model?.coverMiddle ?? ""))
        cell.titleLb.text = model?.nickname
        cell.titleLb.textAlignment = .left
        cell.detailLb.text = model?.name
        cell.tipLb.text = model?.categoryName
       // cell.backgroundColor = .red
      // cell
        return cell
    }
    
}

