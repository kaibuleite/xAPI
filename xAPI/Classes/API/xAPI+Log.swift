//
//  xAPI+Log.swift
//  xSDK
//
//  Created by Mac on 2020/12/28.
//

import UIKit
import Alamofire
import xDefine
import xExtension

extension xAPI {
    
    // MARK: - 错误日志打印
    /// 响应失败
    public static func logResponseError(response : DataResponse<Any>,
                                        record : xReqRecord?)
    {
        print("⚠️ API 响应失败")
        print("************************************")
        self.logReqRecordInfo(record)
        if let obj = response.data {
            if let str = String.init(data: obj, encoding: .utf8) {
                self.showDebugWeb(html: str)
            }
            else {
                print(obj)
            }
        }
        print("************************************")
    }
    /// Api逻辑错误
    public static func logApiCodeError(data : [String : Any],
                                       record : xReqRecord?)
    {
        print("⚠️ API Code 错误")
        print("************************************")
        self.logReqRecordInfo(record)
        print("\(data)")
        print("************************************")
    }
    /// 数据解析错误
    public static func logCheckDataError(data : Any?,
                                         record : xReqRecord?)
    {
        print("⚠️ API 数据解析失败")
        print("************************************")
        self.logReqRecordInfo(record)
        if let str = data as? String {
            self.showDebugWeb(html: str)
        }
        else
        if let obj = data as? Data {
            if let str = String.init(data: obj, encoding: .utf8) {
                self.showDebugWeb(html: str)
            }
            else {
                print(obj)
            }
        }
        print("************************************")
    }
    
    /// 输出请求记录信息
    private static func logReqRecordInfo(_ record : xReqRecord?)
    {
        guard let obj = record else { return }
        print("接口地址：\(self.getUrlPrefix() + obj.url)")
        print("GET参数：\(self.formatterGetString(of: obj.parameter))")
        print("POST参数：\(self.formatterPostString(of: obj.parameter))")
    }
}
