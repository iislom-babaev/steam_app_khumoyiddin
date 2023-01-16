//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class GamesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    let gamesList = LocalCache.gamesList
    var filteredData = [Game]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: GamesTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: GamesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    func configureSearchBar() {
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).textColor = UIColor(named: "SearchHintColor")
        search.searchTextField.leftView?.tintColor = UIColor(named: "SearchHintColor")
        search.searchTextField.textColor = .white
        search.delegate = self
    }
}

extension GamesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()
        
        guard searchText != "" || searchText != " " else {
            return
        }
        for item in gamesList {
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

extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showGameDetail", sender: self)
    }
}

extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.nibName, for: indexPath) as! GamesTableViewCell
        cell.cellConfiguration(cell: cell, indexPath: indexPath, data: isSearching ? filteredData : gamesList)
        
        return cell
    }
}
