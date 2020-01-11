//
//  ANHomeClassifyController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
class ANHomeClassifyController: UIViewController {

    var dataArray:[ANClassifyModel]?{
           didSet{
               collectionView.reloadData()
           }
       }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = FooterViewColor
        creatSubView()
        loadData()
    
    }

    func loadData() {
    let param = Moya_Baseparameters
        
        
        NetWorkRequest(.getClassifyList(parameters: param)) { (result) -> (Void) in
            print(result)
            let json = JSON.init(parseJSON: result)
            
            self.dataArray = (JSONDeserializer<ANClassifyModel>.deserializeModelArrayFrom(json: json["list"].description) as! [ANClassifyModel])
            
        }
        
    }
        
        lazy var collectionView:UICollectionView = {
            let layout = UICollectionViewFlowLayout()
               //  layout.scrollDirection = .horizontal
                 layout.sectionInset = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 5)
            layout.minimumInteritemSpacing = 2.0
            layout.minimumLineSpacing = 2.0
                 let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
                 collectionView.delegate = self
                 collectionView.dataSource = self
                 collectionView.register(ANClassifyColCell.self, forCellWithReuseIdentifier: "cell")
            collectionView.register(ANClassifyHeaderView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: "header")
                 collectionView.backgroundColor = FooterViewColor
            return collectionView
        }()
        

        func creatSubView()  {
            self.view.addSubview(collectionView)
            collectionView.snp.makeConstraints { (make) in
                make.edges.equalTo(0)
            }
        }

    }


extension ANHomeClassifyController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            let model = dataArray![section]
            
            return model.itemList?.count ?? 0
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            
            return self.dataArray?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ANClassifyColCell
            let model = dataArray?[indexPath.section]
            let item = model?.itemList?[indexPath.row]
            cell.iconView.kf.setImage(with: URL.init(string: item?.coverPath ?? ""))
            
            if item?.itemDetail?.keywordName != nil {
               cell.titleLb.text = item?.itemDetail?.keywordName
            }else{
              cell.titleLb.text = item?.itemDetail?.title
            }
            cell.backgroundColor = .white
            return cell
        }
        

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = dataArray![indexPath.section]
        if item.displayStyleType == 0{
                return CGSize.init(width: (YYScreenWidth - 22 )/4.0, height: 40)
              }
              
     return   CGSize.init(width: (YYScreenWidth - 20 )/3.0, height: 40)
    }
    
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: "header", for: indexPath) as! ANClassifyHeaderView
            
            header.titlb.text  = self.dataArray?[indexPath.section].groupName
            return header
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let item = dataArray![section]
        if item.displayStyleType == 0{
            return CGSize.zero
        }
        
        return CGSize.init(width: YYScreenWidth, height: 40)
    }
        
        
    }

