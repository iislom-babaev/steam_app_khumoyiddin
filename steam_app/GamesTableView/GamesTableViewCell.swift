//
//  GamesTableViewCell.swift
//  steam_app
//
//  Created by Khumoyiddin on 03/01/23.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var favoriteStar: UIButton!
    let gamesList = LocalCache.gamesList
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoriteToggle(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "star") {
            setStarImage(string: "star.fill")
            setLabelTextFont(font: .boldSystemFont(ofSize: 15))
        } else {
            setStarImage(string: "star")
            setLabelTextFont(font: .systemFont(ofSize: 15))
        }
    }
    
    func cellConfiguration(cell: GamesTableViewCell, indexPath: IndexPath) {
        let game = gamesList[indexPath.row]
        
        cell.selectionStyle = .none
        cell.setLabelText(text: game.title)
        if game.isFavorite {
            cell.setLabelTextFont(font: .boldSystemFont(ofSize: 15))
            cell.setStarImage(string: "star.fill")
        } else {
            cell.setLabelTextFont(font: .systemFont(ofSize: 15))
            cell.setStarImage(string: "star")
        }
    }
    
    func setLabelText(text: String) {
        titleLabel.text = text
    }
    
    func setLabelTextFont(font: UIFont) {
        titleLabel.font = font
    }
    func setStarImage(string: String) {
        favoriteStar.setImage(UIImage(systemName: string), for: .normal)
    }
    
    
}

extension GamesTableViewCell {
    static let nibName: String = "GamesTableViewCell"
}
