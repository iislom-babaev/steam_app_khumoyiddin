//
//  TabBarViewController.swift
//  steam_app
//
//  Created by Khumoyiddin on 25/01/23.
//

import UIKit

class TabBarViewControoler: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarController()
        setupViewControllers()
        
    }
    
    func setupTabBarController() {
        tabBar.backgroundColor = UIColor(named: "BottomAppBarColor")
        UITabBar.appearance().barTintColor = UIColor(named: "BottomAppBarColor")
    }
    
    func setupViewControllers() {
        let gamesVC = UINavigationController(rootViewController: GamesViewController())
        let favsVC = UINavigationController(rootViewController: FavsViewController())
        let newsVC = UINavigationController(rootViewController: NewsViewController())
        
        gamesVC.title = "Games"
        gamesVC.tabBarItem.image = UIImage(systemName: "list.star")
        
        favsVC.title = "Favorites"
        favsVC.tabBarItem.image = UIImage(systemName: "star.fill")
        
        newsVC.title = "News"
        newsVC.tabBarItem.image = UIImage(systemName: "book.fill")
        
        viewControllers = [gamesVC, favsVC, newsVC]
    }
}
