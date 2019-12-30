//
//  String+ANTool.swift
//  ANXMLY
//
//  Created by 华盛 on 2019/12/24.
//  Copyright © 2019 华盛. All rights reserved.
//

import Foundation
extension String{
    func stringFromPowerInt(count:Int) -> String {
        var tagString = ""
        if count > 100000000 {
            tagString = String(format: "%.1f亿", Double(count) / 100000000)
        } else if count > 10000 {
            tagString = String(format: "%.1f万", Double(count) / 10000)
        } else {
            tagString = "\(count)"
        }
        return tagString
    }
    
    func updateTimeToCurrennTime(timeStamp: Double) -> String {
           //获取当前的时间戳
           let currentTime = Date().timeIntervalSince1970
           //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
           let timeSta:TimeInterval = TimeInterval(timeStamp / 1000)
           //时间差
           let reduceTime : TimeInterval = currentTime - timeSta
           //时间差小于60秒
           if reduceTime < 60 {
               return "刚刚"
           }
           //时间差大于一分钟小于60分钟内
           let mins = Int(reduceTime / 60)
           if mins < 60 {
               return "\(mins)分钟前"
           }
           let hours = Int(reduceTime / 3600)
           if hours < 24 {
               return "\(hours)小时前"
           }
           let days = Int(reduceTime / 3600 / 24)
           if days < 30 {
               return "\(days)天前"
           }
           //不满足上述条件---或者是未来日期-----直接返回日期
           let date = NSDate(timeIntervalSince1970: timeSta)
           let dfmatter = DateFormatter()
           //yyyy-MM-dd HH:mm:ss
           dfmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
           return dfmatter.string(from: date as Date)
       }
    
    
}
