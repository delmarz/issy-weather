//
//  CityWeatherListViewModel.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol CityWeatherListDataSource {
    var weatherList: Observable<[CityWeatherItem]> { get }
    var errorMessage: Observable<String> { get }
    func getWeatherForCityList()
    func bindDataWeather(city: CityWeatherItem) -> CityWeatherDataModel
}

class CityWeatherListViewModel: CityWeatherListDataSource {
    var weatherList: Observable<[CityWeatherItem]>
    var errorMessage: Observable<String>
    
    private let apiHandler: APIHandlerProtocol
    private let weatherListRelay: BehaviorRelay<[CityWeatherItem]> = BehaviorRelay(value: [])
    private let errorSubject = PublishSubject<String>()
    private let disposeBag = DisposeBag()
    
    init(apiHandler: APIHandlerProtocol = APIHandler()) {
        self.apiHandler = apiHandler
        self.weatherList = weatherListRelay.asObservable()
        self.errorMessage = errorSubject.asObservable()
    }
    
    func getWeatherForCityList() {
        apiHandler.getCityWeather()
            .compactMap { $0?.list }
            .subscribe(onNext: { [weak self] wetherInfo in
                self?.weatherListRelay.accept(wetherInfo)
            }, onError: { _ in
                self.errorSubject.onNext("Unable to get weather information for city list.")
            }).disposed(by: disposeBag)
    }
    
    func bindDataWeather(city: CityWeatherItem) -> CityWeatherDataModel {
        guard let data = CityWeatherDataModel(city) else { fatalError("CityWeatherDataModel not found")}
        return data
    }
}
