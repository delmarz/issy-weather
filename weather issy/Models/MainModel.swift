//
//  MainModel.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import Foundation

struct MainModel: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Double
    let sea_level: Double
    let grnd_level: Double
    let humidity: Double
}
