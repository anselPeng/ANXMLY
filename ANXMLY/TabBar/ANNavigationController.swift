//
//  ANNavigationController.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import UIKit



class ANNavigationController: UINavigationController {

  //  let leftBtn = UIButton()
    //let rightBtn =  UIButton()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.delegate
        // Do any additional setup after loading the view.
    }
    

    
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool)
       {
           if children.count > 0 {
               viewController.hidesBottomBarWhenPushed = true
           }
           super.pushViewController(viewController, animated: animated)
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
