//
//  ItemStore.swift
//  Homepwner
//
//  Created by Nicholas Grana on 8/21/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
