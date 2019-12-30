//
//  ANListenSubscribeModel.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/25.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import HandyJSON
struct  ANListenSubscribeModel: HandyJSON {
    
    var albumCover:String?
    var albumId:Int?
    var albumTitle:String?
    var avatar:String?
    var dynamicType:Int?
    var isAuthorized:String?
    var isDraft:Bool?
    var isPaid:Bool?
    var isTop:Bool?
    var lastUpdateAt:Double?
    var nickname:String?
    var status:String?
    var timeline:String?
    var trackId:Int?
    var trackTitle:String?
    var trackType:Int?
    var uid:Int?
    var unreadNum:String?
}
