//
//  ANListenController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit
import LTScrollView

class ANListenController: UIViewController {

    let viewControllers = [ANListenSubscribeController(),ANListenOneKeyController(),ANListenRecommendController()]
    let titles = ["订阅","一键听","推荐"]
    
    let layout : LTLayout = {
        let layout = LTLayout()
        layout.isAverage = true
        layout.sliderWidth = 80
        layout.titleViewBgColor = .white
        layout.titleColor = UIColor.init(r: 178, g: 178, b: 178)
        layout.titleSelectColor = UIColor.init(r: 16, g: 16, b: 16)
        layout.bottomLineColor = .red
        layout.sliderHeight = 56
        return layout
    }()
    
    private func managerReact() -> CGRect {

        let statusBarH = UIApplication.shared.statusBarFrame.size.height
        let Y: CGFloat = statusBarH + 44
        let H: CGFloat = isFullScreen ? (view.bounds.height - Y - 34) : view.bounds.height - Y
        return CGRect(x: 0, y: Y, width: view.bounds.width, height: H)
    }
    
    
    
    lazy var simpManager:LTAdvancedManager = {
        
        
     let advancedManager = LTAdvancedManager(frame: CGRect(x: 0, y: navigationBarHeight, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout, headerViewHandle: {[weak self] in
                guard let strongSelf = self else { return UIView() }
                let headerView = strongSelf.headerView
                return headerView
            })
        return advancedManager
        
    }()
    
    lazy var headerView:ANListenHeaderView = {
        let header = ANListenHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: 90))
        
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(simpManager)
    //    simpleManagerConfig()
        // Do any additional setup after loading the view.
    }
    

}


extension ANListenController : LTSimpleScrollViewDelegate{
    
}


//extension ANListenController {
//
//    //MARK: 具体使用请参考以下
//    private func simpleManagerConfig() {
//
//        //MARK: headerView设置
//        simpManager.configHeaderView {[weak self] in
//            guard let strongSelf = self else { return nil }
//            let headerView = strongSelf.headerView
//            return headerView
//        }
//
//        //MARK: pageView点击事件
//        simpManager.didSelectIndexHandle { (index) in
//            print("点击了 \(index) 😆")
//        }
//
//    }
    
//}
