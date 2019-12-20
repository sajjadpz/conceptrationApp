//
//  Concentration.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    //computed property
    private var indexOfOneAndOnlyFaceUp: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly //use of closure
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil {
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func choseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration,choseCards(at: \(index)), invalid chosen index")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index {
                //check if cards matched
                if cards[index] == cards[matchIndex] {
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
        assert(numberOfPairOfCards > 0, "Concentration.init(at: \(numberOfPairOfCards)), invalid numberofPairOfCards")
        for _ in 0..<numberOfPairOfCards{
            let card = Card()
            cards += [card, card]//copies the card strcut to matching card
        }
    }
}

//extension of protocols
extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first: nil
    }
}
