//
//  CityTableViewCell.swift
//  WorldWeather
//
//  Created by yuzixun on 15/2/3.
//  Copyright (c) 2015年 RayWenderlich. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var cityWeather: CityWeather?{
        didSet{
            configureCell();
        }
    }
    
    private func configureCell(){
        cityImageView.image = cityWeather?.cityImage
        cityNameLabel.text = cityWeather?.name
    }

}
