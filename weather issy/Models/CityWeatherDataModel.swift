//
//  CityWeatherDataModel.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import Foundation


struct CityWeatherDataModel {
    let cityName: String
    let weatherName: String
    let iconURL: URL
 
    init?(_ data: CityWeatherItem) {
        guard let name = data.name,
              let weatherName = data.weather?.first?.description,
              let imageUrl = APPURL.iconURL(data.weather?.first?.icon ?? "") else { return nil}

        self.cityName = name
        self.weatherName = weatherName
        self.iconURL = imageUrl
    }
}
