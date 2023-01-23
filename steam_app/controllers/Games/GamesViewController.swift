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
    var filteredData: [Game] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        search.configureCustomSearchBar()
        search.delegate = self
        self.hideKeyboardWhenTappedAround()
        configureBottomSpacingOnKeyboardAppears()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: GamesTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: GamesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureBottomSpacingOnKeyboardAppears() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        tableView.contentInset = .zero
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
        performSegue(withIdentifier: "showGameDetail", sender: self)
        clearTextFieldOnTap()
    }
    
    func clearTextFieldOnTap() {
        search.searchTextField.text?.removeAll()
        isSearching = false
        tableView.reloadData()
    }
}

extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredData.count : gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.nibName, for: indexPath) as! GamesTableViewCell
        
        cell.configureCell(cell: cell, game: isSearching ? filteredData[indexPath.row] : gamesList[indexPath.row])
        
        return cell
    }
}
