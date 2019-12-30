//
//  ANHomeController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit
import DNSPageView
class ANHomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let style = PageStyle()
        style.isShowBottomLine = true
        style.titleSelectedColor = .black
        style.titleColor = .gray
        style.bottomLineColor = DominantColor
        style.bottomLineHeight = 2.0
        // Do any additional setup after loading the view.
        let titles = ["推荐","分类","VIP","直播","广播"]
        let vcs = [ANHomeRecommedController(),ANHomeClassifyController(),ANHomeVIPController(),ANHomeLiveController(),ANHomeBoardCastController(),]
        
        for vc in vcs {
            self.addChild(vc)
        }
        
        let pageView  = PageView.init(frame: CGRect.init(x: 0, y: navigationBarHeight, width: YYScreenWidth, height: YYScreenHeigth-navigationBarHeight-44), style: style, titles: titles, childViewControllers: vcs)
        self.view.addSubview(pageView)
        
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
