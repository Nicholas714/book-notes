//
//  ViewController.swift
//  Stanford Concentration
//
//  Created by Nicholas Grana on 6/12/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    private var cardButtons = [UIButton]()
    
    override func viewDidLoad() {
        for view in view.subviews {
            for v in view.subviews {
                for v0 in v.subviews {
                    if v0 is UIButton {
                        cardButtons.append(v0 as! UIButton)
                    }
                }
            }
            
        }
        print(cardButtons.count)
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🍑", "🍆", "👨🏻‍💻", "🐶", "⚽️", "🌈", "🇺🇸", "🇮🇹", "🍕"]
    
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        
        return emoji[card.identifier] ?? "?"
    }
    
}

extension Int {
    
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
}
