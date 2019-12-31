//
//  MoyaConfig.swift
//  GHMoyaNetWorkTest
//
//  Created by Guanghui Liao on 4/3/18.
//  Copyright © 2018 liaoworking. All rights reserved.
//

import UIKit
/// 定义基础域名
let Moya_baseURL = "http://mobile.ximalaya.com"

/// 定义返回的JSON数据字段
let RESULT_CODE = "flag"      //状态码

let RESULT_MESSAGE = "message"  //错误消息提示

let Moya_Baseparameters = [
            "device":"iPhone",
            "appid":0,
            "channel":"ios-b1",
            "code":"43_310000_3100",
            "network":"WIFI",
            "operator":3,
            "pullToRefresh":true,
            "scale":3,
            "uid":0,
            "version":"6.5.3",
            "xt": Int32(Date().timeIntervalSince1970),
            "deviceId": UIDevice.current.identifierForVendor!.uuidString] as [String : Any]


/*  错误情况的提示
 {
 "flag": "0002",
 "msg": "手机号码不能为空",
 "lockerFlag": true
 }
 **/
