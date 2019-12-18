//
//  Card.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var id : Int
    
    static var identifiedFactory = 0
    static func getUniqueId() -> Int {
        identifiedFactory += 1
        return Card.identifiedFactory
    }
    
    init() {
         self.id = Card.getUniqueId()
    }
    
}
