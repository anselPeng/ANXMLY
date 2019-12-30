//
//  ANFindDubModel.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/28.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import HandyJSON
class ANFindDubModel: HandyJSON {
    var feedItem:FeedItem?
    var dubbingItem:DubbingItem?
    var height:CGFloat = 0.0
    
   required init() {}
}


class FeedItem: HandyJSON {
    var contentId:Int?
    var contentType:String?
    var recReason:String?
    var recSrc:String?
    var recTrack:String?
    
    
   required init() {}
}


class DubbingItem: HandyJSON {

     var commentCount:Int?
    var coverLarge:String?
    var coverMiddle:String?
    var coverPath:String?
    var coverSmall:String?
    var createAt:Double?
    var duration:Int?
    var favorites:Int?
    var intro:String?
    var logoPic:String?
    var mediaType:String?
    var nickname:String?
    var playPathAacv164:String?
    var playPathAacv224:String?
    var relatedId:String?
    var title:String?
    var topicId:Int?
    var topicTitle:String?
    var topicUrl:String?
    var trackId:Int?
    var uid:Int?
    var updatedAt:Double?

    
   required init() {}
}


