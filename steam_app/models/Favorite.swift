//
//  Favorite.swift
//  steam_app
//
//  Created by Khumoyiddin on 25/01/23.
//

import Foundation

struct Favorite {
    let title: String
    let price: String
    var isOnDiscount: Bool
    
    init(title: String, price: String, isOnDiscount: Bool) {
        self.title = title
        self.price = price
        self.isOnDiscount = isOnDiscount
    }
}
