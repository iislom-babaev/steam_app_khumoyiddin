//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class FavoritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    let favsList = LocalCache.favsList
    var filteredData: [Favorite] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        search.configureCustomSearchBar()
        search.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: FavoritesTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: FavoritesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FavoritesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()
        
        guard searchText != "" || searchText != " " else {
            return
        }
        for item in favsList {
            let text = searchText.lowercased()
            let isArrayContain = item.title.lowercased().ranges(of: text)
            if !isArrayContain.isEmpty {
                filteredData.append(item)
            }
        }
        if searchBar.text == "" {
            isSearching = false
        } else {
            isSearching = true
        }
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : favsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.nibName, for: indexPath) as! FavoritesTableViewCell
        cell.configureCell(cell: cell, with: isSearching ? filteredData[indexPath.row] : favsList[indexPath.row])
        return cell
    }
}
