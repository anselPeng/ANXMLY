//
//  ANListenRecommendModel.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/25.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import HandyJSON

struct  ANListenRecommendModel: HandyJSON {
    var albumId : Int?
     var coverMiddle : String?
     var coverSmall : String?
     var isDraft : Bool?
     var isFinished : Bool?
     var isPaid : Bool?
     var playsCounts : Int?
     var alblastUpdateAtumId : Double?
     var recReason : String?
     var recSrc : String?
     var recTrack : String?
     var refundSupportType : Int?
    var title : String?
    var tracks : Int?
}
