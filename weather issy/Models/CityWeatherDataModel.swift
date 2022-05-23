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
    let weatherDescp: String
    let iconURL: URL
    let temp: String
    let tempMin: String
    let tempMax: String
    let pressure: String
    let humidity: String
    let wSpeed: String
    let clouds: String
 
    init?(_ data: CityWeatherItem) {
        guard let name = data.name,
              let weatherName = data.weather?.first?.main,
              let weatherDescp = data.weather?.first?.description,
              let imageUrl = APPURL.iconURL(data.weather?.first?.icon ?? ""),
             let temp = data.main?.temp,
              let tempMin = data.main?.temp_min,
              let tempMax = data.main?.temp_max,
              let pressure = data.main?.pressure,
              let humidity = data.main?.humidity,
              let wSpeed = data.wind?.speed,
              let clouds = data.clouds?.all
        else { return nil }

        self.cityName = name
        self.weatherName = weatherName
        self.weatherDescp = weatherDescp
        self.iconURL = imageUrl
        self.temp = String(temp)
        self.tempMin = String(tempMin)
        self.tempMax = String(tempMax)
        self.pressure = String(pressure)
        self.humidity = String(humidity)
        self.wSpeed = String(wSpeed)
        self.clouds = String(clouds)
    }
}
