//
//  WeatherModel.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import Foundation

struct WeatherModel: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}
