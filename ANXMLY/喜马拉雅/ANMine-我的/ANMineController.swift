//
//  ANMineController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit

class ANMineController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        self.creatNavbar()
        creatSubView()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        self.header?.vipViewAnimation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.header?.vipViewStopAnimation()
    }
    
    
    var dataArray0:[ANIconTitleModel] = {
        var arr = Array<ANIconTitleModel>()
        let model0 = ANIconTitleModel()
        model0.titleStr = "我要录音"
        model0.iconStr = "麦克风"
        arr.append(model0)
        
        let model1 = ANIconTitleModel()
              model1.titleStr = "我要直播"
              model1.iconStr = "直播"
              arr.append(model1)
        
        let model2 = ANIconTitleModel()
              model2.titleStr = "我的作品"
              model2.iconStr = "视频"
              arr.append(model2)
        
        let model3 = ANIconTitleModel()
              model3.titleStr = "主播工作台"
              model3.iconStr = "工作台"
              arr.append(model3)
        return arr
    }()
    
    var dataArray1:[[ANIconTitleModel]] = {
        
        var result = Array<Any>()
    
        
        var arr0 = Array<ANIconTitleModel>()
        let model0 = ANIconTitleModel()
        model0.titleStr = "分享赚钱"
        model0.iconStr = "钱数"
        arr0.append(model0)
        
        
        let model1 = ANIconTitleModel()
              model1.titleStr = "免流量服务"
              model1.iconStr = "沙漏"
              arr0.append(model1)
        result.append(arr0)
        
        
        var arr1 = Array<ANIconTitleModel>()
        
        let model2 = ANIconTitleModel()
              model2.titleStr = "扫一扫"
              model2.iconStr = "扫一扫"
              arr1.append(model2)
        let model3 = ANIconTitleModel()
              model3.titleStr = "夜间模式"
              model3.iconStr = "月亮"
              arr1.append(model3)
        result.append(arr1)
        
        
        var arr2 = Array<ANIconTitleModel>()
        let model4 = ANIconTitleModel()
              model4.titleStr = "帮助与反馈"
              model4.iconStr = "意见反馈"
              arr2.append(model4)
        result.append(arr2)
        
        return result as! [[ANIconTitleModel]]
    }()
    
    
    func creatSubView()  {
        view.addSubview(tableView)
    }
    
    func creatNavbar() {
        let leftBtn = UIButton()
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        leftBtn.setImage(UIImage.init(named: "msg"), for: .normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView:leftBtn)
        leftBtn.addTarget(self, action: #selector(leftNavbarClicked), for: .touchUpInside)
        
        let rightBtn = UIButton()
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        rightBtn.setImage(UIImage.init(named: "set"), for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView:rightBtn)
        rightBtn.addTarget(self, action: #selector(rightNavbarClicked), for: .touchUpInside)
    }
    
    
    @objc  func leftNavbarClicked() {
        print("左navbar点击了")
    }
    @objc  func rightNavbarClicked() {
        print("右navbar点击了")
        
        self.navigationController?.pushViewController(ANMineSettingController(), animated: true)
    }
    
    
    var header:ANMineHeaderView?
    private lazy var tableView:UITableView = {
        
        let tableView = UITableView.init(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ANMineIconsCell.self, forCellReuseIdentifier: "ANMineIconsCell")
        tableView.rowHeight = 40.0
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: YYScreenWidth, height:200))
        let headerontentView = ANMineHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: 220))
        headerontentView.delegate = self
        self.header = headerontentView
        headerView.addSubview(headerontentView)
        tableView.tableHeaderView = headerView
        return tableView
    }()
    

}


extension ANMineController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataArray1[section-1].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ANMineIconsCell", for: indexPath) as! ANMineIconsCell
            cell.dataArray = dataArray0
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let model = dataArray1[indexPath.section-1][indexPath.row]
            cell.imageView?.image = UIImage.init(named: model.iconStr)
            cell.textLabel?.text = model.titleStr
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell

        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
          return 100.0
        }
        return 50.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataArray1.count+1
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
        return header
    }
    

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("点击了第\(indexPath.section)行，第\(indexPath.row)列")
    }
}

extension ANMineController : ANMineHeaderDelegate{
    func iconBtnClicked(idx: Int) {
        print("header button \(idx) 点击了")
    }
    
}
