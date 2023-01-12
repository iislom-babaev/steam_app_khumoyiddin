//
//  NewsTableViewCell.swift
//  steam_app
//
//  Created by Khumoyiddin on 09/01/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var game: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    let newsList = LocalCache.newsList
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfiguration(cell: NewsTableViewCell, indexPath: IndexPath, data: [News]) {
        let news = data[indexPath.row]
        
        game.text = news.game
        team.text = news.team
        date.text = news.date
        title.text = news.title
    }
}


extension NewsTableViewCell {
    static let nibName: String = "NewsTableViewCell"
}
