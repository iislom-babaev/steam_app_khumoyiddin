//
//  TabBarViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 23/01/23.
//

import UIKit

class FavsViewController: UIViewController {
    let tableView = UITableView()
    let favsList = LocalCache.favsList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBarButtons()
        configureTableView()
        
    }
    func setupView() {
        title = "Favorites"
        view.backgroundColor = UIColor(named: "MainScreenColor")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "TopAppBarColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.standardAppearance = appearance
    }
    
    func setupBarButtons() {
        let sortButton = UIButton()
        sortButton.setTitle("Sort", for: .normal)
        sortButton.setTitleColor(.white.withAlphaComponent(0.75), for: .highlighted)
        sortButton.addTarget(self, action: #selector(onSortTapped), for: .touchUpInside)
        
        let editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.white.withAlphaComponent(0.75), for: .highlighted)
        editButton.addTarget(self, action: #selector(onEditTapped), for: .touchUpInside)
        
        self.navigationItem.setLeftBarButtonItems([UIBarButtonItem(customView: sortButton)], animated: true)
        self.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView: editButton)], animated: true)
    }
    
    func configureTableView() {
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "MainScreenColor")
        tableView.separatorColor = .white
        
        view.addSubview(tableView)
    }
    
    @objc func onSortTapped(_ sender: UIButton) {
    }
    
    @objc func onEditTapped(_ sender: UIButton) {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension FavsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension FavsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.nibName, for: indexPath) as! FavoritesTableViewCell
        
        cell.configureCell(cell: cell, with: favsList[indexPath.row])
        return cell
    }
}
