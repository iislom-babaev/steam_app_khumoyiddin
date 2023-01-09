//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class GamesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let gamesList = LocalCache.gamesList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: GamesTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: GamesTableViewCell.nibName)
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
        return gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.nibName, for: indexPath) as! GamesTableViewCell
        cell.cellConfiguration(cell: cell, indexPath: indexPath)
        
        return cell
    }
    

}
