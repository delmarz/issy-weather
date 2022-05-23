//
//  CityWeatherDetailViewModel.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import RxSwift
import RxCocoa

protocol CityWeatherDetailsDataSource {
    var weatherItem: Observable<CityWeatherDataModel?> { get }
    var errorMessage: Observable<String> { get }
    func getCityWeather(byId: Int)
}

class CityWeatherDetailViewModel: CityWeatherDetailsDataSource {
    var weatherItem: Observable<CityWeatherDataModel?>
    var errorMessage: Observable<String>
    
    private let apiHandler: APIHandlerProtocol
    private let weatherItemRelay: BehaviorRelay<CityWeatherDataModel?> = BehaviorRelay(value: nil)
    private let errorSubject = PublishSubject<String>()
    private let disposeBag = DisposeBag()
    
    init(apiHandler: APIHandlerProtocol = APIHandler(), weatherItemResult: CityWeatherItem) {
        self.apiHandler = apiHandler
        self.weatherItem = weatherItemRelay.asObservable()
        self.errorMessage = errorSubject.asObservable()
    }
    
    func getCityWeather(byId: Int) {
        apiHandler.getCityWeather(byId: byId)
            .subscribe(onNext: { [weak self] weatherData in
                guard let data = weatherData else { return }
                self?.weatherItemRelay.accept(CityWeatherDataModel(data))
            }, onError: { _ in
                self.errorSubject.onNext("Unable to get weather information for weather details.")
            }).disposed(by: disposeBag)
    }
}
