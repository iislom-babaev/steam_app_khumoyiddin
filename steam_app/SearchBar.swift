//
//  SearchBar.swift
//  steam_app
//
//  Created by Khumoyiddin on 17/01/23.
//

import UIKit

extension UISearchBar {
    func configureCustomSearchBar() {
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor(named: "SearchHintColor")
        self.searchTextField.leftView?.tintColor = UIColor(named: "SearchHintColor")
        self.searchTextField.textColor = .white
        if let clearButton = self.searchTextField.value(forKey: "_clearButton") as? UIButton {
             let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
             clearButton.setImage(templateImage, for: .normal)
             clearButton.tintColor = UIColor(named: "SearchHintColor")
         }
    }
}
