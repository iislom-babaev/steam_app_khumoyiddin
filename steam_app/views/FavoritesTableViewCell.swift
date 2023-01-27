//
//  FavoritesTableViewCell.swift
//  steam_app
//
//  Created by Khumoyiddin on 27/01/23.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    static let nibName: String = "FavoritesTableViewCell"
    
    var title: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 17)
        text.textColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var price: UILabel = {
        let text = UILabel()
        text.font = .boldSystemFont(ofSize: 17)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(price)
        
        //Set constraints as per your requirements
        price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        price.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        contentView.addSubview(title)
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(cell: FavoritesTableViewCell, with favorite: Favorite) {
        cell.title.text = favorite.title
        cell.price.text = favorite.price
        cell.price.textColor = favorite.isOnDiscount ? UIColor(named: "GreenColor") : .white
        cell.backgroundColor = .clear
    }
}
