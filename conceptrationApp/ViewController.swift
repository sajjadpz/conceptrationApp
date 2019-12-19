//
//  ViewController.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    private lazy var game = Concentration(numberOfPairOfCards: (touchCards.count + 1) / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet private var touchCards: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = touchCards.firstIndex(of: sender) {
            game.choseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    private func updateViewFromModel(){
        
        for index in touchCards.indices {
            let button = touchCards[index]
            let card = game.cards [index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int: String]()
    
    private var emojiChoices = ["👽","👻","🎃","🍆", "🤡", "👑"]
    
    private func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0{
            let randomIndex = emoji[card.id] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.id] ?? "?"
    }
}

//extensions
extension Int {
    var arc4random: Int {
        if self > 0
        {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
    }
}


