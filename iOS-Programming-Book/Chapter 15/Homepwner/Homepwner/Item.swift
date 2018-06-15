//
//  Item.swift
//  Homepwner
//
//  Created by Nicholas Grana on 8/21/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    var itemKey: String
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let randomAdjective = ["Fluffy", "Rusty", "Shiny"].random()
            let randomNoun = ["Bear", "Spork", "Mac"].random()
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, valueInDollars: randomValue, serialNumber: randomSerialNumber)
        } else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
}

// i created this to make things simpiler
extension Array {
    
    func random() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
    
}
