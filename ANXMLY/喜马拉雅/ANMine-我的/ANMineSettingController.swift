//
//  ANMineSettingController.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/18.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit

class ANMineSettingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "设置"
        self.view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 40.0
        return tableView
    }()
    
    
    var dataArray:[[Dictionary]] = {
        return [[["title": "智能硬件"]],
                
                [["title": "特色闹铃"],
                 ["title": "定时关闭"]],
                
                [["title": "账号与安全"]],
                
                [["title": "推送设置"],
                 ["title": "收听偏好设置"],
                 ["title": "隐私设置"]],
                
                [["title": "断点续听"],
                 ["title": "2G/3G/4G播放和下载"],
                 ["title": "下载音质"],
                 ["title": "清理占用空间"]],
                
                [["title": "特色功能"],
                 ["title": "新版本介绍"],
                 ["title": "给喜马拉雅好评"],
                 ["title": "关于"]]]
        
    }()
    
}


extension ANMineSettingController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row]["title"]
        cell.selectionStyle = .none
        if indexPath.section == 3 && indexPath.row == 1{
            let cellSwitch = UISwitch.init()
            cell.accessoryView = cellSwitch
        }else {
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor =  UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了第\((indexPath.section+1) * (indexPath.row+1))项")
    }
    
    
}
