//
//  Card.swift
//  Stanford Concentration
//
//  Created by Nicholas Grana on 6/13/18.
//  Copyright © 2018 Nicholas Grana. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int 
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
    
}
