//
//  ANFindDubbingController.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/26.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
class ANFindDubbingController: UIViewController{
    
    var dataArray:[ANFindDubModel]?
    var reloadIndexpath:[IndexPath] = []
    
    var beforeScrollViewOffset:CGFloat = 0.0
    lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ANFindDubCell.self, forCellReuseIdentifier: "cell")
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
            make.left.right.bottom.equalTo(0)
        }
        loadData()
    }
    func loadData()  {
        let path = Bundle.main.path(forResource: "FindDud", ofType: "json")
        
        let data = NSData.init(contentsOfFile: path!)
        let dataDic = JSON(data!)
        
        dataArray = (JSONDeserializer<ANFindDubModel>.deserializeModelArrayFrom(json: dataDic["data"].description) as! [ANFindDubModel])
    }
    
}


extension ANFindDubbingController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ANFindDubCell
        let model = self.dataArray![indexPath.row]
        cell.model = model
        
        cell.cellHeightChange = {() in
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dataArray![indexPath.row]
        if model.height > 1 {
            return model.height
        }
        return 220
    }
}

