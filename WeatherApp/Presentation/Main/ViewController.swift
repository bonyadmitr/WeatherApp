//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 29/04/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher

final class ViewController: BackgroundController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let dataSource = ForecastDisplayManager()
    private var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FontPickerManager.shared.delegates.add(self)
        
        dataSource.tableView = tableView
        
        tableView.addRefreshControl(title: "Pull to refresh", color: Colors.text) { [weak self] refreshControl in
            guard let guardSelf = self else { return }
            guardSelf.getForecastWeather(for: guardSelf.text)
            refreshControl.endRefreshing()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCityIfNeeded()
    }
    
    @IBAction func actionSettingsButton(_ sender: UIButton) {
        FabricManager.shared.logSettings()
        performSegue(withIdentifier: "settings", sender: nil)
    }
    
    private func updateCityIfNeeded() {
        let cityName = UserDefaultsManager.shared.cityName
        if text == cityName { return }
        text = cityName
        getForecastWeather(for: cityName)
        updateCityImage(for: cityName)
        
//        _ = WeatherService.shared.current(for: text).then { current -> Void in
//            log(current.temperature)
//        }
    }
    
    private func updateCityImage(for text: String) {
        _ = firstly {
            PhotosService.shared.imageUrl(for: text)
        }.then { url -> Promise<UIImage> in
            ImageDownloader.default.downloadImage(with: url)
        }.then { image -> Void in
            self.backImageView.image = image
            Images.background = image
        }
    }
    
    private func getForecastWeather(for text: String) {
        _ = WeatherService.shared.forecast(for: text).then { forecastResult -> Void in
            self.dataSource.forecasts = forecastResult.list
        }
    }
}
