//
//  CityWeatherViewController.swift
//  weather issy
//
//  Created by Issy Mayor on 22/5/2022.
//

import UIKit
import RxSwift

class CityWeatherViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: CityWeatherListDataSource = CityWeatherListViewModel()
    private let disposeBag = DisposeBag()
    private let cellIdentifier = "weatherCell"
    
    private var weatherList = [CityWeatherItem]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupRx()
    }
    
    private func setupView() {
        tableView.register(CityWeatherCell.self)
    }
    
    private func setupRx() {
        viewModel.weatherList
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] list in
                self?.weatherList = list
            }, onError: { error in
                print("onError: \(error)")
            })
            .disposed(by: disposeBag)

        viewModel.errorMessage
            .asDriver(onErrorJustReturn: "")
            .drive(onNext: { [weak self] messagePrompt in
                self?.showAlertPrompt(title: "Weather", message: messagePrompt)
            }).disposed(by: disposeBag)

        viewModel.getWeatherForCityList()
    }
    
    private func showAlertPrompt(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
}

// MARK: - City Weather TV Data Source

extension CityWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityWeatherCell
       cell.configure(viewModel.bindDataWeather(city: weatherList[indexPath.row]))
        return cell
    }
}

// MARK: - City Weather TV Delegate

extension CityWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
    

