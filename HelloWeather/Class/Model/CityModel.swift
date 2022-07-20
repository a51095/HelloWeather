//
//  CityModel.swift
//  HelloWeather
//
//

// WeatherModel
struct WeatherModel: HandyJSON {
    /// 天气状况
    var main: String?
    
    /// 天气描述
    var description: String?
    
    /// 天气图标
    var icon: String?
}

// CityModel
struct CityModel: HandyJSON {
    /// 城市名称
    var name: String?
    
    /// WeatherModel
    var weatherModel: WeatherModel?
}
