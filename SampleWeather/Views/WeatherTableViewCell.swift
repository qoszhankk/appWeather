//
//  WeatherTableViewCell.swift
//  SampleWeather
//
//  Created by Kamshat Koszhanova on 03.11.2022.
//

//import UIKit
//import SnapKit
//
//final class WeatherTableViewCell: UITableViewCell {
//
//    lazy private var myLabel: UILabel = {
//        let label = UILabel()
//        label.text = ""
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        contentView.backgroundColor = .white
//        setupViews()
//        setupConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setText(with content: String) {
//        myLabel.text = content
//    }
//
//}
////MARK: setup views and constraints
//private extension WeatherTableViewCell {
//    func setupViews() {
//        contentView.addSubview(myLabel)
//    }
//
//    func setupConstraints() {
//        myLabel.snp.makeConstraints {
//            make in
//            make.edges.equalToSuperview().inset(10)
//        }
//    }
//}
