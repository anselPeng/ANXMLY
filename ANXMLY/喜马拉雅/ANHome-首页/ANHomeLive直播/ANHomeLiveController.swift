//
//  ANHomeLiveController.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/18.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import LTScrollView
import HandyJSON
import SwiftyJSON
class ANHomeLiveController: UIViewController {
    
    var liveTypeArray :[ANLiveTypeModel]?
    var iconsArray:[ANLiveIconModel]?
    var bananerData:[ANLiveBananerModel]?
    var dataArray:[ANVipCategoryModel]?
    var rankArray:[ANLiveRankModel]?
    
    //var headerView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.addSubview(simpManager)
        loadLiveList()
        
    }
    
    
    func refresh() {
        //  self.headerView?.dataArray = self.bananerData
        
        self.headerView.dataArray = self.iconsArray
    }
    
    func loadData()  {
        loadLiveClassifyData()
        loadBanaList()
        loadRankList()
    }
    
    
    
    func loadLiveList() {
        
        let param = Moya_Baseparameters
        NetWorkRequest(.getHomeLiveList(parameters: param)) { (result) -> (Void) in
            let json = JSON.init(parseJSON: result)
            let array = JSONDeserializer<ANLiveTypeModel>.deserializeModelArrayFrom(json: json["data"]["categoryVoList"].description) as! [ANLiveTypeModel]
            self.liveTypeArray = array
            self.view.addSubview(self.simpManager)
            self.loadData()
        }
    }
    
    func loadLiveClassifyData() {
        
        let param = Moya_Baseparameters
        NetWorkRequest(.getHomeLiveClassifyList(parameters: param)) { (result) -> (Void) in
            let json = JSON.init(parseJSON: result)
            let array = JSONDeserializer<ANLiveIconModel>.deserializeModelArrayFrom(json: json["data"]["materialVoList"].description) as! [ANLiveIconModel]
            self.iconsArray = array
            self.refresh()
            
        }
    }
    
    func loadBanaList()  {
        var param = ["categoryId":-3] as [String:Any]
        param = appendBaseParamaters(parameters: param)
        NetWorkRequest(.getHomeLiveBanaList(parameters: param)) { (result) -> (Void) in
            
            let json = JSON.init(parseJSON: result)
            let array = JSONDeserializer<ANLiveBananerModel>.deserializeModelArrayFrom(json: json["data"].description) as! [ANLiveBananerModel]
            // self.ban = array
            self.bananerData = array
            self.headerView.bananerArray = array
        }
        
        
    }
    
    func loadRankList()  {
        
        var param = ["categoryId":-3] as [String:Any]
        param = appendBaseParamaters(parameters: param)
        NetWorkRequest(.getHomeLiveRankList(parameters: param)) { (result) -> (Void) in
            
            let json = JSON.init(parseJSON: result)
            let array = JSONDeserializer<ANLiveRankModel>.deserializeModelArrayFrom(json: json["data"]["multidimensionalRankVos"].description) as! [ANLiveRankModel]
            self.rankArray = array
            self.headerView.rankArray = array
            print(result)
        }
    }
    
//    let viewControllers = [ANHomeLiveItemController(),ANHomeLiveItemController(),ANHomeLiveItemController(),ANHomeLiveItemController(),ANHomeLiveItemController()]
//    let titles = ["热门","情感","有声","新秀","二次元"]
    
    let layout : LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true
        layout.sliderWidth = 80
        
        layout.titleViewBgColor = .white
        layout.titleColor = UIColor.init(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor.init(r: 16, g: 16, b: 16)
        layout.bottomLineColor = .red
        layout.sliderHeight = 56
        layout.isHovered = false
        layout.isScrollEnabled = false
        layout.titleFont = UIFont.systemFont(ofSize: 14)
        return layout
    }()
    
    private func managerReact() -> CGRect {
        let Y: CGFloat =   44
        let H: CGFloat = isFullScreen ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: 0, y: 0, width: view.bounds.width, height: H)
    }
    
    
    
    lazy var simpManager:LTAdvancedManager = {
        
        var vcs:[ANHomeLiveItemController] = Array()
        var titles:[String] = Array()
        for item in self.liveTypeArray!{
            let  vc =  ANHomeLiveItemController()
            vc.id  = item.id!
            vcs.append(vc)
            titles.append(item.name!)
        }
        
        let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y: 0, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight), viewControllers: vcs, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
            guard let strongSelf = self else { return UIView() }
            let headerView = strongSelf.headerView
            return headerView
        })
        return advancedManager
        
    }()
    
    lazy var headerView:ANLiveHeaderView = {
        let header = ANLiveHeaderView()
        header.frame = CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: header.height())
        return header
    }()
    
}
