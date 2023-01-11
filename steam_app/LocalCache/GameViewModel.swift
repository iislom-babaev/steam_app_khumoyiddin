//
//  GameViewModel.swift
//  steam_app
//
//  Created by Khumoyiddin on 03/01/23.
//

import Foundation

struct Game {
    let title: String
    var isFavorite: Bool
    
    init(title: String, isFavorite: Bool) {
        self.title = title
        self.isFavorite = isFavorite
    }
}
