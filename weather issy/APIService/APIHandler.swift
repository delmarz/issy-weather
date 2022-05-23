//
//  APIHandler.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import RxSwift

protocol APIHandlerProtocol {
   func getCityWeather() -> Observable<CityWeatherResult?>
}

class APIHandler: APIHandlerProtocol {
    private let apiManager: APIManager
    
    init(_ apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    func getCityWeather() -> Observable<CityWeatherResult?> {
        guard let url = APPURL.WeatherList else { return
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
}
