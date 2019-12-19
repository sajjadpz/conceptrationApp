//
//  Card.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    
    func hash(into hasher: inout Hasher)  {
        hasher.combine(id)
    }
    
    static func ==(lhs:Card, rhs:Card) ->Bool{
        return lhs.id == rhs.id
    }
    var isFaceUp = false
    var isMatched = false
    private var id : Int
    
    private static var identifiedFactory = 0
    
    private static func getUniqueId() -> Int {
        identifiedFactory += 1
        return Card.identifiedFactory
    }
    
    init() {
         self.id = Card.getUniqueId()
    }
    
}
