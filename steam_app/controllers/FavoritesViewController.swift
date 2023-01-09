//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    let favsList = LocalCache.favsList
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    @IBAction func sortFavorites(_ sender: Any) {
    }
    @IBAction func editFavorite(_ sender: Any) {
    }
    func configureTableView() {
        let nib = UINib(nibName: FavoritesTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: FavoritesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.nibName, for: indexPath) as! FavoritesTableViewCell
        cell.cellConfiguration(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    
}


