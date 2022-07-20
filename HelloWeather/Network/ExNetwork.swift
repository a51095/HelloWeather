//
//  CCNetwork.swift
//  HelloWeather
//
//

// MARK: - ResponseData
/// 自定义响应数据结构
struct ResponseData {
    var resCode: Int = -1
    var data: [String: Any]? = nil
}

// MARK: - NetworkRequest
/// - url:                                 请求URL(String类型)
/// - method:                        请求方法(默认post)
/// - parameters:      请求参数(Dictionary<String, Any>类型)
/// - showErrorMsg:             是否展示公共响应错误信息(Bool类型)
/// - encoding:                     请求编码格式(URLEncoding默认类型)
/// - response:                     响应回调结果(逃逸闭包)

/// 网络请求方法
func NetworkRequest(url: String, method: HTTPMethod = .post, params: [String: Any] = [:], showErrorMsg: Bool = true, encoding: URLEncoding = .default, response: @escaping ((ResponseData) -> Void)) {
    // 公共参数
    var commonParams = ["appid": AppKeys.weatherKey] as [String: Any]
    // 合并请求参数
    if !params.isEmpty { commonParams.merge(dict: params) }
    
    DispatchQueue.main.async { kAppDelegate().window!!.showLoading() }
    AF.request(url, method: method, parameters: commonParams, encoding: encoding).responseJSON { res in
        DispatchQueue.main.async { kAppDelegate().window!!.hideLoading() }
        // 容错处理,若请求报错error,则直接返回默认数据
        guard res.error == nil else {
            if showErrorMsg {
                kAppDelegate().window!!.toast("a request error.", type: .failure)
            }
            response(ResponseData());
            return
        }
        
        // 容错处理,若请求res.value空值,则直接返回默认数据
        guard let dic = res.value as? [String: Any] else {
            if showErrorMsg {
                kAppDelegate().window!!.toast("a data parsing error.", type: .failure)
            }
            response(ResponseData());
            return
        }
        
        let data = ResponseData(resCode: 200, data: dic)
        response(data)
    }
}

