//
//  CityWeatherDetailViewController.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import UIKit
import Kingfisher
import RxCocoa
import RxSwift

class CityWeatherDetailViewController: UIViewController {
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var weatherNameLabel: UILabel!
    @IBOutlet weak var weatherDescpLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var cloudsLevel: UILabel!
    
    var viewModel: CityWeatherDetailsDataSource!
    var weatherItem: CityWeatherItem!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayInitialValue()
        setupRx()
    }
    
    private func setupRx() {
        viewModel.weatherItem
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] weatherData in
                guard let item = weatherData else { return }
               self?.updateData(item)
            }, onError: { error in
                print("onError: \(error)")
            })
            .disposed(by: disposeBag)

        viewModel.errorMessage
            .asDriver(onErrorJustReturn: "")
            .drive(onNext: { messagePrompt in
                ///Show prompt error
                print("Detail Screen Error: \(messagePrompt)")
            }).disposed(by: disposeBag)
        
        viewModel.getCityWeather(byId: weatherItem.id ?? 0)
    }
    
    private func displayInitialValue() {
        guard let data = CityWeatherDataModel(weatherItem) else { return }
        updateData(data)
    }

    private func updateData(_ item: CityWeatherDataModel) {
        tempMinLabel.text = item.tempMin
        tempMaxLabel.text = item.tempMax
        cityNameLabel.text = item.cityName
        weatherImageView.kf.setImage(with: item.iconURL)
        weatherNameLabel.text = item.weatherName
        weatherDescpLabel.text = item.weatherDescp
        tempLabel.text = item.temp
        pressureLabel.text = item.pressure
        humidityLabel.text = item.humidity
        windSpeedLabel.text = item.wSpeed
        cloudsLevel.text = item.clouds
    }
}
