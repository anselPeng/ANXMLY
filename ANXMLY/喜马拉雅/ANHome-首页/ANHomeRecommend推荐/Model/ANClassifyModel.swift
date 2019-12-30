//
//  ANClassifyModel.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/30.
//  Copyright © 2019 华盛. All rights reserved.
//

import UIKit
import HandyJSON

class ANClassifyModel: HandyJSON {
    
    var displayStyleType: Int?
    var groupName: String?
    var itemList:[ANClassifyItemModel]?
    
    required init() {
    }
}

class ANClassifyItemModel: HandyJSON {
    
    var itemType: Int?
    var title: String?
    var coverPath: String?
    var itemDetail: ANClassifyDetailModel?
    
    required init() {
    }
}


class ANClassifyDetailModel: HandyJSON {
    
    var categoryId: Int?
    var categoryType: Int?
    var filterSupported: Bool?
    var title: String?
    var name: String?
    var keywordName: String?
    var keywordId: Int?
    
    required init() {
    }
}

