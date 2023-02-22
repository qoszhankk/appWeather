//
//  WeatherTableViewHeaderView.swift
//  SampleWeather
//
//  Created by Kamshat Koszhanova on 03.11.2022.
//

import UIKit
import SnapKit

final class WeatherTableViewHeaderView: UITableViewHeaderFooterView {
    
    lazy private var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Aktobe"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var degreeLabel: UILabel = {
        let label = UILabel()
        label.text = " 17°"
        label.font = UIFont.systemFont(ofSize: 90)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Partly Cloudy"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy private var highLowLabel: UILabel = {
        let label = UILabel()
        label.text = "H:25° L:10°"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        changeAllTextColor(with: .white)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeAllTextColor(with color: UIColor) {
        let subviews = contentView.subviews
        
        for subview in subviews {
            if subview is UILabel {
                let currentLabel = subview as! UILabel
                currentLabel.textColor = UIColor.white
            }
        }
    }
}

// MARK: - Setup Views and Constraints

private extension WeatherTableViewHeaderView {
    
    func setupViews() {
        contentView.addSubview(cityLabel)
        contentView.addSubview(degreeLabel)
        contentView.addSubview(weatherLabel)
        contentView.addSubview(highLowLabel)
    }
    
    func setupConstraints() {
        cityLabel.snp.makeConstraints {
            make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(degreeLabel.snp.top)
        }
        
        degreeLabel.snp.makeConstraints {
            make in
            make.center.equalToSuperview()
        }
        
        weatherLabel.snp.makeConstraints {
            make in
            make.top.equalTo(degreeLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        highLowLabel.snp.makeConstraints {
            make in
            make.top.equalTo(weatherLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

