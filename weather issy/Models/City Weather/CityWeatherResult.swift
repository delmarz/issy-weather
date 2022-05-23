//
//  CityWeatherResult.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import Foundation

struct CityWeatherResult: Codable {
    let cnt: Int
    let list: [CityWeatherItem]
}
