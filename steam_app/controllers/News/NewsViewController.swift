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
    var filteredData: [News] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        search.configureCustomSearchBar(searchBar: search)
        search.delegate = self
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureTableView() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        let nib = UINib(nibName: NewsTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: NewsTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 20 + tableView.rowHeight, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tableView.rowHeight, right: 0)
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
        performSegue(withIdentifier: "showNewsDetail", sender: self)
        clearTextFieldOnTap()
    }
    
    func clearTextFieldOnTap() {
        search.searchTextField.text?.removeAll()
        isSearching = false
        tableView.reloadData()
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

