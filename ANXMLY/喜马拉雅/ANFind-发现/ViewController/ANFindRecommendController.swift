//
//  ANFindRecommendController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/26.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
class ANFindRecommendController: UIViewController {



    var dataModel:ANFindRecommendModel?
    
        
        lazy var tableView:UITableView = {
            let tableview = UITableView()
            tableview.delegate = self
            tableview.dataSource = self
            tableview.register(ANFindRecommendCell.self, forCellReuseIdentifier: "cell")
            tableview.rowHeight = 120
            tableview.tableFooterView = UIView()
            return tableview
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.addSubview(tableView)
             glt_scrollView = tableView
            tableView.snp.makeConstraints { (make) in
                make.top.equalTo(50)
                make.left.right.equalTo(0)
                make.bottom.equalTo(-50)
            }
            loadData()
            // Do any additional setup after loading the view.
        }
        func loadData()  {
            
            let path = Bundle.main.path(forResource: "FindRecommend", ofType: "json")
            
            let data = NSData.init(contentsOfFile: path!)
            let dataDic = JSON(data!)
            
            dataModel = (JSONDeserializer<ANFindRecommendModel>.deserializeFrom(json: dataDic["data"].description))
        }
        
    }


    extension ANFindRecommendController : UITableViewDelegate,UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataModel?.streamList?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ANFindRecommendCell
            let model = self.dataModel?.streamList![indexPath.row]
            cell.model = model
            
            return cell
        }
        
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let model = dataModel?.streamList![indexPath.row]
            var collectionH = model?.cellHeight ?? 0.0

            if collectionH < 1.0 {
                collectionH =  ANFindRecommendCell().cellHeight(model: model!)
            }
            
            
            return collectionH
        }
    
        
    }
