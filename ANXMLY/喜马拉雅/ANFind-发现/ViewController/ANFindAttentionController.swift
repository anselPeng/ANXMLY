//
//  ANFindAttentionController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/26.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON
class ANFindAttentionController: UIViewController {
    
    var dataArray:[ANFindAttentionModel]?
    
    lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ANAttentionCell.self, forCellReuseIdentifier: "cell")
        tableview.rowHeight = 120
        tableview.tableFooterView = UIView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-50)
        }
         glt_scrollView = tableView
        loadData()
        // Do any additional setup after loading the view.
    }
    func loadData()  {
        let path = Bundle.main.path(forResource: "FindAttention", ofType: "json")
        
        let data = NSData.init(contentsOfFile: path!)
        let dataDic = JSON(data!)
        
        dataArray = (JSONDeserializer<ANFindAttentionModel>.deserializeModelArrayFrom(json: dataDic["data"]["eventInfos"].description) as! [ANFindAttentionModel])
        
        
        
    }
    
}


extension ANFindAttentionController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ANAttentionCell
        let model = self.dataArray![indexPath.row]
        cell.model = model
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = dataArray![indexPath.row]
        var collectionH = model.cellHeight

        if collectionH < 1.0 {
            collectionH =  ANAttentionCell().cellHeight(model: model)
        }
        
        
        return collectionH
    }
    
    
    func collectionViewHeight(count:Int) -> CGFloat {
        
        
       
        
        
        let itemH = ANAttentionCell().itemHeight()
        var  lines = (count-1)/3 + 1
        if lines > 3 {
            lines = 3
        }
        if count == 0 {
            lines = 0
        }
        
        return CGFloat(lines) * itemH + 20
    }
    
    
    //MARK: -根据后台时间戳返回几分钟前，几小时前，几天前
    func updateTimeToCurrennTime(timeStamp: Double) -> String {
        //获取当前的时间戳
        let currentTime = Date().timeIntervalSince1970
        //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
        let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
        //时间差
        let reduceTime : TimeInterval = currentTime - timeSta
        //时间差小于60秒
        if reduceTime < 60 {
            return "刚刚"
        }
        //时间差大于一分钟小于60分钟内
        let mins = Int(reduceTime / 60)
        if mins < 60 {
            return "\(mins)分钟前"
        }
        let hours = Int(reduceTime / 3600)
        if hours < 24 {
            return "\(hours)小时前"
        }
        let days = Int(reduceTime / 3600 / 24)
        if days < 30 {
            return "\(days)天前"
        }
        //不满足上述条件---或者是未来日期-----直接返回日期
        let date = NSDate(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        //yyyy-MM-dd HH:mm:ss
        dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
        return dfmatter.string(from: date as Date)
    }
}
