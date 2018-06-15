//
//  SelectionTextField.swift
//  Homepwner
//
//  Created by Nicholas Grana on 8/29/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

// SILVER CHALLENGE: A custom UITextField
class SelectionTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        
        borderStyle = .bezel
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        
        borderStyle = .roundedRect
        return true
    }
    
}
