//
//  ANFindController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit
import UIKit
import LTScrollView

class ANFindController: UIViewController {
        let viewControllers = [ANFindAttentionController(),ANFindRecommendController(),ANFindDubbingController()]
        let titles = ["关注动态","推荐动态","趣配音"]
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
        
        
        
        lazy var simpManager:LTSimpleManager = {
            let simpManager = LTSimpleManager.init(frame: managerReact(), viewControllers: viewControllers, titles: titles, currentViewController: self, layout: layout)
            simpManager.delegate = self
            return simpManager
            
        }()
        
        lazy var headerView:ANFindHeaderView = {
            let header = ANFindHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: YYScreenWidth, height: 140))
            
            return header
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()

            view.addSubview(simpManager)
            simpleManagerConfig()
            // Do any additional setup after loading the view.
        }
        
    }



extension ANFindController : LTSimpleScrollViewDelegate{
    
}

extension ANFindController {
      
      //MARK: 具体使用请参考以下
      private func simpleManagerConfig() {
          
          //MARK: headerView设置
          simpManager.configHeaderView {[weak self] in
              guard let strongSelf = self else { return nil }
              let headerView = strongSelf.headerView
              return headerView
          }
          
          //MARK: pageView点击事件
          simpManager.didSelectIndexHandle { (index) in
              print("点击了 \(index) 😆")
          }
          
      }
      
  }

