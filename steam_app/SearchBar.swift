//
//  SearchBar.swift
//  steam_app
//
//  Created by Khumoyiddin on 17/01/23.
//

import UIKit

extension UISearchBar {
    func configureCustomSearchBar(searchBar: UISearchBar) {
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor(named: "SearchHintColor")
        searchBar.searchTextField.leftView?.tintColor = UIColor(named: "SearchHintColor")
        searchBar.searchTextField.textColor = .white
        if let clearButton = searchBar.searchTextField.value(forKey: "_clearButton") as? UIButton {
             let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
             clearButton.setImage(templateImage, for: .normal)
             clearButton.tintColor = UIColor(named: "SearchHintColor")
         }
    }
}
