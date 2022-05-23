//
//  CityWeatherCell.swift
//  weather issy
//
//  Created by Issy Mayor on 23/5/2022.
//

import UIKit
import Kingfisher

class CityWeatherCell: UITableViewCell {

    @IBOutlet var cityWeatherNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    func configure(_ data: CityWeatherDataModel?) {
        guard let data = data else { return }
        cityWeatherNameLabel.text = data.cityName
        weatherImageView.kf.setImage(with: data.iconURL)
    }

}
