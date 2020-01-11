//
//  ANVipFocusImagesModel.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/31.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON

class ANVipFocusImagesModel: HandyJSON {

    var cover:String?
    var link:String?
    var adId:Int?
    var adType:Int?

   required init() {}
}




class ANVipCategoryModel: HandyJSON {
    var list:[ANVipIconItemModel]?
    var moduleType:Int?
    var title:String?
    var hasMore:Int?
   required init() {}
}


class ANVipIconItemModel: HandyJSON {
    var bubbleText:String?
    var contentType:String?
    var contentUpdatedAt:Int?
    var coverPath:String?
    var displayClass:String?
    var enableShare:Bool?
    var id:Int?
    var isExternalUrl:Bool?
    var properties:ANVipPropertiesmModel?
    var sharePic:String?
    var subtitle:String?
    var title:String?
    var albumId:Int?
    var commentsCount:Int?
    var coverLarge:String?
    var coverMiddle:String?
    var coverSmall:String?
    var discountedPrice:String?
    var displayDiscountedPrice:String?
    var displayPrice:Double?
    var displayVipPrice:String?
    var intro:String?
    var isFinished:Bool?
    var isVipFree:Bool?
    var nickname:String?
    var playsCounts:Int?
    var priceTypeEnum:String?
    var price:Double?
    var priceUnit:String?
    var tags:String?
    var trackId:Int?
    var tracks:Int?
    var trackTitle:String?
    var uid:Int?
    var vipFreeType:Int?
    var vipPrice:Double?
   required init() {}
}

class ANVipPropertiesmModel: HandyJSON {
    var url:String?
    var type:Int?
    var isPaid:Bool?
   required init() {}
}
