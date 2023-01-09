//
//  LocalCashe.swift
//  steam_app
//
//  Created by Khumoyiddin on 03/01/23.
//

import Foundation


class LocalCache {
    static var gamesList = [
        Game(title: "Game 1", isFavorite: false),
        Game(title: "Game 1", isFavorite: false),
        Game(title: "Game 2", isFavorite: false),
        Game(title: "Game 3", isFavorite: false),
        Game(title: "CS: GO", isFavorite: false),
        Game(title: "Dota2", isFavorite: true),
        Game(title: "CTA V", isFavorite: true),
        Game(title: "Game 4", isFavorite: false),
        Game(title: "Game 5", isFavorite: false),
        Game(title: "Game 6", isFavorite: false),
        Game(title: "Game 7", isFavorite: false),
        Game(title: "Game 8", isFavorite: true),
        Game(title: "Game 9", isFavorite: false),
        Game(title: "Game 10", isFavorite: false)
    ]
    static var favsList = [
        Favorite(title: "CS: GO", price: "$9.99", isOnDiscount: false),
        Favorite(title: "Dota2", price: "Free", isOnDiscount: false),
        Favorite(title: "Civilization VI", price: "$17.35 (-20%)", isOnDiscount: true),
        Favorite(title: "CTA V", price: "$33.99", isOnDiscount: false)
    ]
}
