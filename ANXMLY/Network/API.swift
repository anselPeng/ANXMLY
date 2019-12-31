//
//  API.swift
//  GHMoyaNetWorkTest
//
//  Created by Guanghui Liao on 3/30/18.
//  Copyright © 2018 liaoworking. All rights reserved.
//https://github.com/Moya/Moya/blob/master/docs_CN/Examples/Basic.md

import Foundation
import Moya

enum API{
    case getHomeRecommend(parameters:[String:Any])//首页推荐接口
    case getListenOneKey(parameters:[String:Any])//一键听接口
    case getClassifyList(parameters:[String:Any])//首页分类接口
    case getHomeVipList(parameters:[String:Any])//首页VIP接口
    case uploadHeadImage(parameters: [String:Any],imageDate:Data)
}

extension API:TargetType{
    var baseURL: URL {
        switch self {
      //  case .easyRequset:
        //    return URL.init(string:"http://news-at.zhihu.com/api/")!
        default:
            return URL.init(string:(Moya_baseURL))!
        }
    }
    
    var path: String {
        switch self {
        case .getHomeRecommend:
            return "/discovery-firstpage/v2/explore/ts-1532411485052"
        case .getListenOneKey:
            return "/radio-station/v1/subscribe-channel/list"
        case .getClassifyList:
                   return "/mobile/discovery/v5/categories/1532410996452"
        case .getHomeVipList:
                         return "/product/v4/category/recommends/ts-1532592638951"
                  
        case .uploadHeadImage( _, _):
            return ""
        }
    }
    
    var method: Moya.Method {
    
        return .get
    }
    

    //    这个是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }

    //    该条请API求的方式,把参数之类的传进来
    var task: Task {
//        return .requestParameters(parameters: nil, encoding: JSONArrayEncoding.default)
        switch self {

        case let .getHomeRecommend(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case let .getListenOneKey(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case let .getClassifyList(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case let .getHomeVipList(parameters):
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        //图片上传
        case .uploadHeadImage(let parameters, let imageDate):
            ///name 和fileName 看后台怎么说，   mineType根据文件类型上百度查对应的mineType
            let formData = MultipartFormData(provider: .data(imageDate), name: "file",
                                              fileName: "hangge.png", mimeType: "image/png")
            return .uploadCompositeMultipart([formData], urlParameters: parameters)
        }
        
    
        
        //可选参数https://github.com/Moya/Moya/blob/master/docs_CN/Examples/OptionalParameters.md
//        case .users(let limit):
//        var params: [String: Any] = [:]
//        params["limit"] = limit
//        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
 
    
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
 
}
