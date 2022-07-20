//
//  CityModel.swift
//  HelloWeather
//
//

// WeatherModel
struct WeatherModel: HandyJSON {
    /// weather condition
    var main: String?
    
    /// weather description
    var description: String?
    
    /// weather icon
    var icon: String?
}

// CityModel
struct CityModel: HandyJSON {
    /// City name
    var name: String?
    
    /// WeatherModel
    var weatherModel: WeatherModel?
}
