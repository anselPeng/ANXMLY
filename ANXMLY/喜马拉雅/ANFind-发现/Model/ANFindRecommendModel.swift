//
//  ANFindRecommendModel.swift
//  ANXMLY
//
//  Created by Ansel on 2019/12/28.
//  Copyright © 2019 Ansel. All rights reserved.
//

import UIKit
import HandyJSON

class ANFindRecommendModel: HandyJSON {
    var emptyTip:NSString?
    var endScore:Int?
    var hasMore:NSString?
    var pullTip:NSString?
    var startScore:Int?
    var streamList:[StreamModel]?

    
    
  required  init() {}
}


class StreamModel: HandyJSON {
    var avatar:NSString?
    var commentsCount:Int?
    var content:NSString?
    var id:Int?
    var issuedTs:Double?
    var liked:Bool?
    var likesCount:Int?
    var nickname:String?
    var subscribed:NSString?
    var recSrc:NSString?
    var recTrack:NSString?
    var score:Double?
    var subType:NSString?
    var type:NSString?
    var uid:Int?
    var picUrls:[PicUrlModel]?
    var cellHeight:CGFloat = 0.0
    
    
     required  init() {}
}



class PicUrlModel: HandyJSON {
    var originUrl:NSString?
    var thumbnailUrl:NSString?
     required  init() {}
}
