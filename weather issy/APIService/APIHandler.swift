//
//  APIHandler.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import RxSwift

protocol APIHandlerProtocol {
    ///Get weather List or byID
    func getCityWeather() -> Observable<CityWeatherResult?>
    func getCityWeather(byId: Int) -> Observable<CityWeatherItem?>
}

class APIHandler: APIHandlerProtocol {
    private let apiManager: APIManager
    
    init(_ apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func getCityWeather() -> Observable<CityWeatherResult?> {
        guard let url = APPURL.weatherList else { return
            Observable.error(APIError.urlNotFound)
        }
        let resource = Resource<CityWeatherResult>(url: url)
        return apiManager.load(resource: resource)
            .map { weatherResult -> CityWeatherResult in
                weatherResult
            }
            .asObservable()
            .retry(2)
    }
    
    func getCityWeather(byId: Int) -> Observable<CityWeatherItem?> {
        guard let url = APPURL.weatherDetail(byId: byId) else { return
            Observable.error(APIError.urlNotFound)
        }
        let resource = Resource<CityWeatherItem>(url: url)
        return apiManager.load(resource: resource)
            .map { weatherItem -> CityWeatherItem in
                weatherItem
            }
            .asObservable()
            .retry(2)
    }
}
