//
//  CityWeatherItem.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import Foundation

struct CityWeatherItem: Codable {
    let id: Int?
    let main: MainModel?
    let weather: [WeatherModel]?
    let wind: WindModel?
    let clouds: CloudsModel?
    var name: String?
    
}
