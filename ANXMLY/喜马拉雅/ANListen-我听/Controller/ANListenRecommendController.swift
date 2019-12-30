//
//  ANListenRecommendController.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/25.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import UIKit
import HandyJSON
import SwiftyJSON
import LTScrollView
class ANListenRecommendController: UIViewController , LTTableViewProtocal {
    
    var dataArray:[ANListenRecommendModel]?
    
    lazy var tableView:UITableView = {
        let tableview = tableViewConfig(CGRect(x: 0, y: 0, width:YYScreenWidth, height: YYScreenHeigth-64-44), self, self, nil)
        tableview.register(ANListenRecommendCell.self, forCellReuseIdentifier: "cell")
        tableview.rowHeight = 100
        tableview.tableFooterView = UIView()
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        glt_scrollView = tableView
//        tableView.snp.makeConstraints { (make) in
//            make.top.equalTo(50)
//            make.left.right.bottom.equalTo(0)
//        }
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        let path = Bundle.main.path(forResource: "listenRecommend", ofType: "json")
        let jsonData = NSData.init(contentsOfFile: path!)
        let json = JSON.init(jsonData!)
        let arr = json["data"]["albums"]
        dataArray = (JSONDeserializer<ANListenRecommendModel>.deserializeModelArrayFrom(json:arr.description) as! [ANListenRecommendModel])
        
        tableView.reloadData()
    }
    
}


extension ANListenRecommendController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ANListenRecommendCell
        
        let model = self.dataArray![indexPath.row]
        cell.imgView.kf.setImage(with: URL.init(string: model.coverSmall!))
        cell.titleLb.text = model.title
        cell.detailLb.text = model.recReason
        cell.playLb.text = String().stringFromPowerInt(count: model.playsCounts ?? 0)
        cell.sectionLb.text = String(model.recTrack!) + "集"
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
