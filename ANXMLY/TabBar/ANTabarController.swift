//
//  ANTabarController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit
import ESTabBarController_swift
class ANTabarController: ESTabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupChidrenController()
        self.delegate = self as UITabBarControllerDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.selectedIndex = 0
    }
    
    func setupChidrenController() {
        
        let vc0 = ANHomeController()
        vc0.title = "首页"
        vc0.view.backgroundColor = .white
        let tab0 = ESTabBarItem.init(ANBaseTabBar(), title: "首页", image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "home_1"), tag: 0)
        vc0.tabBarItem = tab0
        let nav0 = ANNavigationController.init(rootViewController: vc0)
        self.addChild(nav0)
        
        let vc1 = ANListenController()
              vc1.title = "我听"
              vc1.view.backgroundColor = .white
              vc1.tabBarItem = ESTabBarItem.init(ANBaseTabBar(), title: "我听", image: UIImage.init(named: "favor"), selectedImage: UIImage.init(named: "favor_1"), tag: 1)
              let nav1 = ANNavigationController.init(rootViewController: vc1)
              self.addChild(nav1)
        
        let vc2 = ANPlayController()
        vc2.title = "播放"
        vc2.view.backgroundColor = .white
        vc2.tabBarItem = ESTabBarItem.init(ANTabBarMidView() , title: "播放", image: UIImage.init(named: "tab_play"), selectedImage: UIImage.init(named: "tab_play"), tag: 2)
        let nav2 = ANNavigationController.init(rootViewController: vc2)
        self.addChild(nav2)
        
        
        let vc3 = ANFindController()
           vc3.title = "发现"
           vc3.view.backgroundColor = .white
           vc3.tabBarItem = ESTabBarItem.init(ANBaseTabBar(), title: "发现", image: UIImage.init(named: "find"), selectedImage: UIImage.init(named: "find_1"), tag: 3)
           let nav3 = ANNavigationController.init(rootViewController: vc3)
           self.addChild(nav3)
        
        
        let vc4 = ANMineController()
        vc4.title = "我的"
        vc4.view.backgroundColor = .white
        vc4.tabBarItem = ESTabBarItem.init(ANBaseTabBar(), title: "我的", image: UIImage.init(named: "me"), selectedImage: UIImage.init(named: "me_1"), tag: 4)
        let nav4 = ANNavigationController.init(rootViewController: vc4)
        //nav4.creatNavBar(imageleft: "msg", imageRight: "set")
        self.addChild(nav4)
        self.selectedViewController = nav0
//        for vc in self.children {
//                vc.view.backgroundColor = .white
//            }
    }
    
    
//    for vc in self.children {
//            vc.view.backgroundColor = .white
//        }
    
    func creatChildViewController(vc:UIViewController,title:String,imgNormal:String,imgSel:String) -> UIViewController {
        
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named:imgNormal)
        vc.tabBarItem.selectedImage = UIImage.init(named:imgSel)
        vc.view.backgroundColor = .white
        return ANNavigationController.init(rootViewController: vc)
    }
    
    
}

extension ANTabarController : UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(self.selectedIndex)
    }
  
}
