//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class GamesViewController: UIViewController {
    let tableView = UITableView()
    let gamesList = LocalCache.gamesList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupView()
    }
    
    func setupView() {
        title = "Games"
        view.backgroundColor = UIColor(named: "MainScreenColor")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "TopAppBarColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.standardAppearance = appearance
    }
    
    func configureTableView() {
        tableView.register(GamesTableViewCell.self, forCellReuseIdentifier: GamesTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "MainScreenColor")
        tableView.separatorColor = .white
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension GamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension GamesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GamesTableViewCell.nibName, for: indexPath) as! GamesTableViewCell
        
        cell.configureCell(cell: cell, with: gamesList[indexPath.row])
        return cell
    }
}
