//
//  ViewController.swift
//  conceptrationApp
//
//  Created by sajjad pervaiz on 16/09/2019.
//  Copyright © 2019 BlueZero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    lazy var game = Concentration(numberOfPairOfCards: (touchCards.count + 1) / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var touchCards: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = touchCards.firstIndex(of: sender) {
            game.choseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    func updateViewFromModel(){
        
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
    
    var emoji = [Int: String]()
    
    var emojiChoices = ["👽","👻","🎃","🍆", "🤡", "👑"]
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.id] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
    }
}


