//
//  ViewController.swift
//  Stanford Calculator
//
//  Created by Nicholas Grana on 4/12/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var display: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // records when a user is typing digits
    var userIsInTheMiddleOfTyping = false
    
    // convience for converting the display when performing operationg on it
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    // Responsible for all digits by appending that digit to the label when it is touched
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
    
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display!.text = textCurrentlyInDisplay + digit
        } else {
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    @IBAction func touchDecimal(_ sender: UIButton) {
        if !userIsInTheMiddleOfTyping {
            display.text! = "0."
            userIsInTheMiddleOfTyping = true
        }else if !display.text!.contains(".") {
            display.text! += "."
        }
    }
    
    @IBAction func touchcClear(_ sender: UIButton) {
        brain.reset()
        descriptionLabel.text! = " "
        display.text! = "0"
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        // user typed a digit and then clicked an operation
        if userIsInTheMiddleOfTyping {
            // set the left side of the equation (what will be added/multiplied)
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }

        if let mathematicalSymbol = sender.currentTitle {
            // MVC does not allow calculations here, so just send over the symbol with the operand which will handle it
            brain.performOperation(mathematicalSymbol)
            
            if brain.resultIsPending {
                descriptionLabel.text! = brain.description + " ... "
            } else {
                descriptionLabel.text! = brain.description + " = "
            }
            
        }
    
        if let result = brain.result  {
            displayValue = result
        }
    }
    
    

    

}

