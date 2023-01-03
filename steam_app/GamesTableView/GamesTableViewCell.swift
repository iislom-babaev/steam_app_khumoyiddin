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

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteToggle(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: "star") {
            favoriteStar.setImage(UIImage(systemName: "star.fill"), for: .normal)
            titleLabel.font = .boldSystemFont(ofSize: 15)
        } else {
            favoriteStar.setImage(UIImage(systemName: "star"), for: .normal)
            titleLabel.font = .systemFont(ofSize: 15)
            
        }
    }
}
