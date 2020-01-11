//
//  ANHomeVIPController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON
class ANHomeVIPController: UIViewController {
    
    var bananerData:[ANVipFocusImagesModel]?
    var dataArray:[ANVipCategoryModel]?
    var headerView:ANVipHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatSubview()
        loadData()
        
    }
    
    func refresh() {
        self.headerView?.dataArray = self.bananerData
        self.tableView.reloadData()
    }
    
    func loadData()  {
        var param = ["categoryId":33] as [String : Any]
        param = appendBaseParamaters(parameters: param)
        NetWorkRequest(.getHomeVipList(parameters: param)) { (result) -> (Void) in
            let json = JSON.init(parseJSON: result)
            self.bananerData = (JSONDeserializer<ANVipFocusImagesModel>.deserializeModelArrayFrom(json: json["focusImages"]["data"].description) as! [ANVipFocusImagesModel])
            
            self.dataArray = (JSONDeserializer<ANVipCategoryModel>.deserializeModelArrayFrom(json: json["categoryContents"]["list"].description) as! [ANVipCategoryModel])
            
            self.refresh()
        }
    }
    
    
    func creatSubview() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.grouped)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ANRecomendWheelCell.self, forCellReuseIdentifier: "ANRecomendWheelCell")
        tableView.register(ANIconsTableCell.self, forCellReuseIdentifier: "ANIconsTableCell")
        tableView.register(ANHomeBookCell.self, forCellReuseIdentifier: "ANHomeBookCell")
        tableView.register(ANVipGussLikeCell.self, forCellReuseIdentifier: "ANVipGussLikeCell")
        tableView.register(ANLikeHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        // tableView.register(ANChangeFooterView.self, forHeaderFooterViewReuseIdentifier: "footer")
        
        
        let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: YYScreenWidth * 480/1200))
        
        let headerView = ANVipHeaderView.init(frame:  CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: YYScreenWidth  * 480/1200))
        header.addSubview(headerView)
        self.headerView = headerView
        tableView.tableHeaderView = header
        return tableView
    }()
    
    
    
}

extension ANHomeVIPController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let model = self.dataArray![section]
        let type = model.moduleType
        if type == 15 {
            return 0
        }
        if type == 5 {
            return model.list?.count ?? 0
        }
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let model = self.dataArray![indexPath.section]
        let type = model.moduleType
        if type == 14 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANIconsTableCell", for: indexPath) as! ANIconsTableCell
            cell.dataArray = model.list
            cell.selectionStyle = .none
            return cell
        }
        
        if type == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeBookCell", for: indexPath) as! ANHomeBookCell
            let item = model.list?[indexPath.row]
            
            cell.imgView.kf.setImage(with: URL.init(string: item?.coverSmall ?? ""))
            cell.titleLb.text = item?.title
            cell.detailLb.text = item?.intro
            cell.playLb.text = String().stringFromPowerInt(count:item?.playsCounts ?? 0)
            cell.sectionLb.text = String().stringFromPowerInt(count:item?.tracks ?? 0)
            
            return cell
        }
        
        
        if type == 33 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANVipGussLikeCell", for: indexPath) as! ANVipGussLikeCell
            cell.dataArray = model.list
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.dataArray![indexPath.section]
        var height:CGFloat = 0.0
        
        let type = model.moduleType
        if type == 14 {
            height = 80.0
        }
        if type == 5 {
            height =  120.0
        }
        
        if type == 33 {
            height = (YYScreenWidth - 30 )/3.0 + 60
        }
        return height
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ANLikeHeader
        header.contentView.backgroundColor = .white
        let model = dataArray![section]
        let title = model.title
        header.layer.masksToBounds = true
        header.textLb.text = title
        return header
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let model = self.dataArray![section]
        let type = model.moduleType
        
        
        if type == 14
            || type == 15 {
            return 0.00001
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        footer.backgroundColor = FooterViewColor
        return footer
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let model = self.dataArray![section]
        let type = model.moduleType
        if type == 15 {
            return 0.00001
        }
        
        return 10
    }
    
    
}
