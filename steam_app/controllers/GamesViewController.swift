//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class GamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "GamesTableViewCell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: "GamesTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapping on cell")
    }
}


extension GamesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalCache.gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GamesTableViewCell", for: indexPath) as! GamesTableViewCell
        let game = LocalCache.gamesList[indexPath.row]
        cell.titleLabel.text = game.title
        if game.isFavorite {
            cell.favoriteStar.imageView?.image = UIImage(systemName: "star.fill")
            cell.titleLabel.font = .boldSystemFont(ofSize: 15)
        }
        
        return cell
    }
    
}
