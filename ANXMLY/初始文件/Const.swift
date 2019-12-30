//
//  Const.swift
//  ANXMLY
//
//  Created by ansel on 2019/12/16.
//  Copyright © 2019 ansel. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import SwiftyJSON
import HandyJSON
import SwiftMessages

let YYScreenWidth = UIScreen.main.bounds.size.width
let YYScreenHeigth = UIScreen.main.bounds.size.height
let DominantColor = UIColor.init(red: 242/255.0, green: 77/255.0, blue: 51/255.0, alpha: 1)
let FooterViewColor = UIColor.init(red: 240/255.0, green: 241/255.0, blue: 244/255.0, alpha: 1)



let isFullScreen = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
// iphone X
let isIphoneX = YYScreenHeigth == 812 ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = isFullScreen ? 88 : 64
// tabBarHeight
let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49



