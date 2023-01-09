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
