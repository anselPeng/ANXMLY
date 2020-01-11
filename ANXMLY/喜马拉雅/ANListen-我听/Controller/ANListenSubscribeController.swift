//
//  ANListenSubscribeController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/25.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
class ANListenSubscribeController: UIViewController {

    var dataArray:[ANListenSubscribeModel]?
    
    lazy var tableView:UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(ANListenSubscribeCell.self, forCellReuseIdentifier: "cell")
        tableview.rowHeight = 100
        tableview.tableFooterView = UIView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        glt_scrollView = tableView
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.bottom.equalTo(0)
        }
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "listenSubscibe", ofType: "json")
        let jsonData = NSData.init(contentsOfFile: path!)
        let json = JSON.init(jsonData!)
        let arr = json["data"]["albumResults"]
        dataArray = (JSONDeserializer<ANListenSubscribeModel>.deserializeModelArrayFrom(json:arr.description) as! [ANListenSubscribeModel])
        
        tableView.reloadData()
    }

}

extension ANListenSubscribeController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ANListenSubscribeCell
        
        let model = self.dataArray![indexPath.row]
        cell.iconView.kf.setImage(with: URL.init(string: model.albumCover!))
        cell.titleLb.text = model.albumTitle
        cell.detailLb.text = model.trackTitle
        
        cell.timeLb.text = updateTimeToCurrennTime(timeStamp: model.lastUpdateAt ?? 0)
        return cell
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
