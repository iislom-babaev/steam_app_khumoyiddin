//
//  FavoritesTableViewCell.swift
//  steam_app
//
//  Created by Khumoyiddin on 09/01/23.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    let favsList = LocalCache.favsList
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(cell: FavoritesTableViewCell, with favorite: Favorite) {
        cell.setTitleText(text: favorite.title)
        cell.setPriceText(text: favorite.price)
        cell.setOnDicsountColor(isOnDiscount: favorite.isOnDiscount, color: UIColor(named: "GreenColor")!)
    }
    
    func setTitleText(text: String) {
        titleLabel.text = text
    }
    
    func setPriceText(text: String) {
        priceLabel.text = text
    }
    
    func setOnDicsountColor(isOnDiscount: Bool, color: UIColor) {
        if isOnDiscount {
            priceLabel.textColor = color
        } else {
            priceLabel.textColor = .white
        }
    }
}

extension FavoritesTableViewCell {
    static let nibName: String = "FavoritesTableViewCell"
}
