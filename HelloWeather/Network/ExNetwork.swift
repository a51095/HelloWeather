//
//  CCNetwork.swift
//  HelloWeather
//
//

// MARK: - ResponseData
struct ResponseData {
    var resCode: Int = -1
    var data: [String: Any]? = nil
}

// MARK: - NetworkRequest
func NetworkRequest(url: String, method: HTTPMethod = .post, params: [String: Any] = [:], showErrorMsg: Bool = true, encoding: URLEncoding = .default, response: @escaping ((ResponseData) -> Void)) {
    // Common parameters
    var commonParams = ["appid": AppKeys.weatherKey] as [String: Any]
    // Merge request parameters
    if !params.isEmpty { commonParams.merge(dict: params) }
    
    DispatchQueue.main.async { kAppDelegate().window!!.showLoading() }
    AF.request(url, method: method, parameters: commonParams, encoding: encoding).responseJSON { res in
        DispatchQueue.main.async { kAppDelegate().window!!.hideLoading() }
        // Fault tolerant processing. If the request reports an error, the default data will be returned directly
        guard res.error == nil else {
            if showErrorMsg {
                kAppDelegate().window!!.toast("a request error.", type: .failure)
            }
            response(ResponseData());
            return
        }
        
        // Fault tolerant processing. If res.value is requested to be null, the default data will be returned directly
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

