//
//  SettingsController.swift
//  WeatherApp
//
//  Created by Bondar Yaroslav on 04/06/2017.
//  Copyright © 2017 Bondar Yaroslav. All rights reserved.
//

import UIKit
import Alamofire

final class SettingsController: UIViewController {
    
    @IBOutlet private weak var searchContainerView: UIView!
    
    fileprivate var searchController: SearchController!
    fileprivate var placesController = PlacesController()
    fileprivate let autocompleteManager = AutocompleteManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        FontPickerManager.shared.delegates.add(self)
    }
    
    @IBAction func actionSomeButton(_ sender: UIButton) {
        
    }
    
    @IBAction func actionSomeButton2(_ sender: UIButton) {
        
    }
    
    private func setupSearchController() {
        placesController.delegate = self
        
        searchController = SearchController(searchResultsController: placesController)
        searchController.setup(in: self)
        searchController.addSearchBar(to: searchContainerView)
        searchController.searchBar.lzPlaceholder = "new_city"
        searchController.searchResultsUpdater = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fonts" {
            guard let navVC = segue.destination as? UINavigationController,
                let vc = navVC.topViewController as? FontsController else { return }
            vc.delegate = self
        } else if segue.identifier == "colors" {
            guard let vc = segue.destination as? ColorsController else { return }
            vc.delegate = self
        }
    }
    
    deinit {
        self.searchController.view.removeFromSuperview()
    }
}
extension SettingsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        autocompleteManager.startSearch(with: text) { results in
            self.placesController.places = results
        }
    }
}
extension SettingsController: PlacesControllerDelegate {
    func didSelect(place: NSAttributedString) {
        searchController.isActive = false
        UserDefaultsManager.shared.cityName = place.string
    }
}
extension SettingsController: FontsControllerDelegate {
    func didSelect(fontName: String) {
        searchController.searchBar.textField.font = Fonts.base.font(with: 18)
        FontPickerManager.shared.updateUI(for: fontName)
    }
}
extension SettingsController: ColorsControllerDelegate {
    func didSelect(color: UIColor) {
        Colors.main = color
        AppearanceManager.shared.configurateAll()
    }
}
