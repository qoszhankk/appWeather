//
//  ViewController.swift
//  SampleWeather
//
//  Created by Kamshat Koszhanova on 03.11.2022.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    
    lazy private var sectionNames: [String] = ["Windy conditions from 3PM-5PM, with heavy snow expected at 6PM", "📆 7-day forecast"]
    
    lazy private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clouds")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var weatherTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        let headerView = WeatherTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 275))
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 20
        return tableView
    }()
    
    lazy private var backgroundBlurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}

// MARK: - TableView DataSource and Delegate Methods

extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: let cell = TableViewCellWithCollectionView()
            cell.backgroundColor = .clear
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 20
            return cell
        case 1 : let cell = TableViewCellWithTableView()
            cell.backgroundColor = .clear
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension WeatherViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
        }
    }
    
}

// MARK: - Setup Views and Constraints

private extension WeatherViewController {
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(weatherTableView)
    }
    
    func setupConstraints() {
        
        backgroundImageView.snp.makeConstraints {
            make in
            make.edges.equalToSuperview()
        }
        
        weatherTableView.snp.makeConstraints {
            make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
}

// SOLID
// S - Single Responsibility
// O - Open-Closed
