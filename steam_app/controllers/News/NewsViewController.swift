//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var search: UISearchBar!
    let  newsList = LocalCache.newsList
    var filteredData = [News]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchBar()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: NewsTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: NewsTableViewCell.nibName)
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

extension NewsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()
        
        guard searchText != "" || searchText != " " else {
            return
        }
        for item in newsList {
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

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showNewsDetail", sender: self)
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.nibName, for: indexPath) as! NewsTableViewCell
        cell.cellConfiguration(cell: cell, indexPath: indexPath, data: isSearching ? filteredData : newsList)
        
        return cell
    }
}

