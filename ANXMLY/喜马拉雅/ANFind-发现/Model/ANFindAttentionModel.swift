//
//  ANFindAttentionModel.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/26.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON
class ANFindAttentionModel: HandyJSON  {
    var authorInfo:AuthorInfo?
    var contentInfo:ContentInfo?
    var eventTime:Double?
    var id:Int?
    var isFromRepost:Bool?
    var isPraise:Bool?
    var statInfo:StateInfo?
    var timeline:Double?
    var type:Int?
    var cellHeight:CGFloat = 0
    required init() {}
}


class AuthorInfo: HandyJSON {
    var anchorGrade:Int?
    var avatarUrl:String?
    var isV:Bool?
    var isVip:Bool?
    var nickname:String?
    var uid:Int?
    var userGrade:Int?
    var verifyType:Int?
    
     required init() {}
}

class ContentInfo: HandyJSON {
    
    var text:String?
    var picInfos:[PicInfo]?
    
    
     required init() {}
}

class StateInfo: HandyJSON {
    var commentCount:Int?
    var praiseCount:Int?
    var repostCount:Int?
    
     required init() {}
}

class PicInfo: HandyJSON {
    
    var Int:String?
    var originUrl:String?
    var rectangleUrl:String?
    var squareUrl:String?
    
     required init() {}
}



