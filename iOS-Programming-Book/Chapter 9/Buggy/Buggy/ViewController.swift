//
//  ViewController.swift
//  Buggy
//
//  Created by Nicholas Grana on 8/18/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Called buttonTapped(_:)")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        // going one step too far with the range
        for _ in 0..<10 {
            array.removeObject(at: 0)
        }
    }

}

