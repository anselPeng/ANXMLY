//
//  ANLiveIconModel.swift
//  ANXMLY
//
//  Created by Ansel on 2020/1/6.
//  Copyright © 2020 Ansel. All rights reserved.
//

import UIKit
import HandyJSON

class  ANLiveTypeModel: HandyJSON {
    var name:String?
    var id:Int?
    var dataArray:[LiveModel] = Array()
    required init() {
    }
}

struct ANLiveItemModel: HandyJSON {
    var coverSmall:String?
    var id:Int?
    var name:String?
    var nickname:String?
    var categoryName:String?
    var info:String?
}

struct ANLiveIconModel: HandyJSON {
    var title:String?
    var coverPath:String?
    var id:Int?
    var targetUrl:String?
    var type:Int?
}

struct ANLiveBananerModel: HandyJSON {
    var name:String?
    var cover:String?
    var adid:Int?
    var link:String?
    var realLink:String?
    var type:Int?
}

struct ANLiveRankModel: HandyJSON {
    var dimensionName:String?
    var dimensionType:String?
    var htmlUrl:String?
    var ranks:[ANLiveRankItemModel]?
}

struct ANLiveRankItemModel: HandyJSON {
    var coverSmall:String?
    var nickname:String?
    var uid:Int?
}

