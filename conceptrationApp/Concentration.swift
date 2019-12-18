//
//  Concentration.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    //computed property
    var indexOfOneAndOnlyFaceUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func choseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                //check if cards matched
                if cards[index].id == cards[matchIndex].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUp = index
            }
        }
    }
    
    init(numberOfPairOfCards: Int) {
        for _ in 0..<numberOfPairOfCards{
            let card = Card()
            cards += [card, card]//copies the card strcut to matching card
        }
    }
}