//
//  CityWeatherItem.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import Foundation

struct CityWeatherItem: Codable {
    let main: MainModel?
    let weather: [WeatherModel]?
    let wind: WindModel?
    var name: String?
}
