//
//  GamesTableViewCell.swift
//  steam_app
//
//  Created by Khumoyiddin on 25/01/23.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    static let nibName: String = "GamesTableViewCell"
    
    let starFav: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "OrangeColor")
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    var title: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 17)
        text.tintColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    @objc func didTapButton(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "star") {
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(starFav)
        starFav.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //Set constraints as per your requirements
        starFav.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        starFav.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        starFav.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        starFav.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        contentView.addSubview(title)
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(cell: GamesTableViewCell, with game: Game) {
        cell.title.text = game.title
        cell.title.font = .systemFont(ofSize: 17)
        cell.title.textColor = .white
        cell.starFav.imageView?.image = UIImage(systemName: game.isFavorite ? "star.fill" : "star")
        cell.backgroundColor = .clear
    }
}
