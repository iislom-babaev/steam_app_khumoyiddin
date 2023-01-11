//
//  NewsGameViewModel.swift
//  steam_app
//
//  Created by Khumoyiddin on 09/01/23.
//

import Foundation

struct News {
    let game: String
    let team: String
    let date: String
    let title: String
    
    init(game: String, team: String, date: String, title: String) {
        self.game = game
        self.team = team
        self.date = date
        self.title = title
    }
}
