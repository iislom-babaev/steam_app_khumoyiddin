//
//  ViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 28/12/22.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let  newsList = LocalCache.newsList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    @IBAction func filter(_ sender: Any) {
        print("filtering news")
    }
    
    func configureTableView() {
        let nib = UINib(nibName: NewsTableViewCell.nibName, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: NewsTableViewCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
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
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.nibName, for: indexPath) as! NewsTableViewCell
        cell.cellConfiguration(cell: cell, indexPath: indexPath)
        
        return cell
    }
}

