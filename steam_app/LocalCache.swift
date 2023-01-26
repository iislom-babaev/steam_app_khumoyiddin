//
//  File.swift
//  steam_app
//
//  Created by Khumoyiddin on 25/01/23.
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
    static var newsList = [
        News(game: "CS:GO", team: "by Numantian Games", date: "1 Nov, 2020", title: "Best PC games of 2020"),
        News(game: "CS: GO", team: "by Allow Games", date: "31 Oct, 2020", title: "Tournament Winner!"),
        News(game: "Dota2", team: "by Valve", date: "31 Oct, 2020", title: "New Antimage strategy"),
        News(game: "CS: GO", team: "by Gearbox Crew", date: "30 Oct, 2020", title: "Tournament schedule!"),
        News(game: "Civilization VI", team: "by Software Publishers", date: "29 Oct, 2020", title: "Don't miss our Halloween Sale!"),
        News(game: "Civilization VI", team: "by Software Publishers", date: "28 Oct, 2020", title: "New DLC is coming soon"),
        News(game: "GTA V", team: "by RockStar Games", date: "26 Oct, 2020", title: "Important patch notes")
    ]
    static var favsList = [
        Favorite(title: "CS: GO", price: "$9.99", isOnDiscount: false),
        Favorite(title: "Dota2", price: "Free", isOnDiscount: false),
        Favorite(title: "Civilization VI", price: "$17.35 (-20%)", isOnDiscount: true),
        Favorite(title: "CTA V", price: "$33.99", isOnDiscount: false)
    ]
}
