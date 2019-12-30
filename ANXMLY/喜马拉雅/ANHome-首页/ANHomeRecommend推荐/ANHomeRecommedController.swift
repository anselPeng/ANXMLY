//
//  ANHomeRecommedController.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/18.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import HandyJSON
class ANHomeRecommedController: UIViewController {
    var recommentObj:ANHomeRecommendModel?
    let noHeaderTypeArray = ["ad","focus","topBuzz","square"]
    var bananerData:[BannerData]?
    var gussLikeData:[GuessYouLikeModel]?
    var boutiqueData:[GuessYouLikeModel]?
    var booksData:[CategoriesForShortModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        creatSubView()
        loadData()
    }
    
    func loadData() {
        var parameters =  [ "includeActivity":true,"includeSpecial":true,"categoryId":-2] as [String : Any]
        parameters = appendBaseParamaters(parameters: parameters)
        NetWorkRequest(.getHomeRecommend(parameters: parameters)) { (responseString) -> (Void) in
            //后台flag为1000是后台的result code
            //  print(responseString)
            
            let mapObject = JSONDeserializer<ANHomeRecommendModel>.deserializeFrom(json: responseString)
            self.recommentObj = mapObject
            let count = self.recommentObj!.list!.count
            for idx in 0 ..< count{
                let model = self.recommentObj?.list?[idx]
                let type = model?.moduleType
                if type == "focus"{
                    let focusJosn = model?.list?[0]
                    let focus = JSONDeserializer<FocusModel>.deserializeFrom(dict: focusJosn)
                    model?.data = focus?.data
                }
                if type == "guessYouLike"
                    || type == "paidCategory"
                    || type == "categoriesForLong"
                    || type == "cityCategory"{
                    let gussLike = model?.list
                    model?.data = (JSONDeserializer<GuessYouLikeModel>.deserializeModelArrayFrom(array: gussLike) as! [GuessYouLikeModel])
                }
        
                if type == "categoriesForShort"
                || type == "categoriesForExplore" {
                    let data = model?.list
                    model?.data = (JSONDeserializer<CategoriesForShortModel>.deserializeModelArrayFrom(array: data) as! [CategoriesForShortModel])
                }
                
                if type == "playlist"{
                    let data = model?.list
                    model?.data = (JSONDeserializer<PlaylistModel>.deserializeModelArrayFrom(array: data) as! [PlaylistModel])
                }
                
                if type == "live"{
                                  let data = model?.list
                                  model?.data = (JSONDeserializer<LiveModel>.deserializeModelArrayFrom(array: data) as! [LiveModel])
                              }
                
                
            }
            
            
            
            self.tableView.reloadData()
        }
    }
    
    
    func creatSubView() {
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
        tableView.register(ANHomeGussLikeCell.self, forCellReuseIdentifier: "ANHomeGussLikeCell")
        tableView.register(ANHomeBookCell.self, forCellReuseIdentifier: "ANHomeBookCell")
        tableView.register(ANHomeLiveTableCell.self, forCellReuseIdentifier: "ANHomeLiveTableCell")
        tableView.register(ANLikeHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.register(ANChangeFooterView.self, forHeaderFooterViewReuseIdentifier: "footer")
        return tableView
    }()
    
    
    
}

extension ANHomeRecommedController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = self.recommentObj?.list![section]
        let type = model?.moduleType
        
        if type == "categoriesForShort"
        || type ==  "playlist"
        || type == "categoriesForExplore" {
            
            return model?.list?.count ?? 0
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.recommentObj?.list![indexPath.section]
        let type = model?.moduleType
        if type == "focus" {
            let cell  = tableView.dequeueReusableCell(withIdentifier: "ANRecomendWheelCell", for: indexPath) as! ANRecomendWheelCell
            cell.dataArray = model?.data as? [BannerData]
            return cell
        }
        
//        if type == "guessYouLike" {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeGussLikeCell", for: indexPath) as! ANHomeGussLikeCell
//
//            cell.dataArray = model?.data as? [GuessYouLikeModel]
//            return cell
//        }
        
        if type == "paidCategory"
        || type == "guessYouLike"
        || type == "categoriesForLong"
        || type == "cityCategory" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeGussLikeCell", for: indexPath) as! ANHomeGussLikeCell
            
            cell.dataArray = model?.data as? [GuessYouLikeModel]
            return cell
        }
        if type == "categoriesForShort"
        || type == "categoriesForExplore" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeBookCell", for: indexPath) as! ANHomeBookCell
            
            let item = model?.data?[indexPath.row] as? CategoriesForShortModel
            cell.imgView.kf.setImage(with: URL.init(string: item?.pic ?? ""))
            cell.titleLb.text = item?.title
            cell.detailLb.text = item?.subtitle
            cell.playLb.text = String().stringFromPowerInt(count:item?.playsCount ?? 0)
            cell.sectionLb.text = String().stringFromPowerInt(count:item?.tracksCount ?? 0)
            return cell
        }
        
        if type == "playlist"{
                 let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeBookCell", for: indexPath) as! ANHomeBookCell
                 
                 let item = model?.data?[indexPath.row] as? PlaylistModel
                 cell.imgView.kf.setImage(with: URL.init(string: item?.coverPath ?? ""))
                 cell.titleLb.text = item?.title
                 cell.detailLb.text = item?.subtitle
                 cell.playLb.text = "0"
                 cell.sectionLb.text = "0"
                 return cell
             }
        
        if type == "live"{
                       let cell = tableView.dequeueReusableCell(withIdentifier: "ANHomeLiveTableCell", for: indexPath) as! ANHomeLiveTableCell
                              
                              cell.dataArray = model?.data as? [LiveModel]
                      return cell
                  }
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.recommentObj?.list![indexPath.section]
        let type = model?.moduleType
        if type == "focus" {
            
            return 480*YYScreenWidth/1200.0
        }
        
        if type == "guessYouLike"{
            
            return 320
        }
        
        if type == "live" {
            if (model?.list!.count)! <= 3{
                return 165
            }else{
                return 330
            }
            
        }
        
        if type == "paidCategory"
        || type == "categoriesForLong"
        || type == "cityCategory" {
            
            return 160
        }
        
        if type == "categoriesForShort"
        || type == "playlist"
        || type == "categoriesForExplore" {
            
            return 120.0
        }
        
        
        if type == "square" {
            return 0.0
        }
        if type == "ad" {
            return 0.0
        }
        
        if type == "topBuzz" {
            return 0.0
        }
        
        return 0.0
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recommentObj?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! ANLikeHeader
        header.contentView.backgroundColor = .white
        let model = recommentObj?.list![section]
        var title = model?.title
        
        if ((title?.lengthOfBytes(using: .utf8)) != nil) {
        }else{
            if model?.moduleType == "guessYouLike" {
                title = "猜你喜欢"
            }
        }
        header.textLb.text = title
        return header
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "footer") as! ANChangeFooterView
        footer.contentView.backgroundColor = .white
        return footer
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let model = self.recommentObj?.list![section]
        let type = model?.moduleType
        if self.noHeaderTypeArray.contains(type ?? "") {
            return 0
        }
        if model?.list?.isEmpty == true {
            return 0.0
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        
        let model = self.recommentObj?.list![section]
        let type = model?.moduleType
        if self.noHeaderTypeArray.contains(type ?? "") {
            return 0
        }
        if model?.list?.isEmpty == true {
            return 0.0
        }
        
        return 40.0
    }
    
    
}
