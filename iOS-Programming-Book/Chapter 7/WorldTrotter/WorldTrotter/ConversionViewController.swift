//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nicholas Grana on 8/11/17.
//  Copyright © 2017 Nicholas Grana. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    let local = Locale.current
    
    // bottom label that shows current celsius temperate
    @IBOutlet var celsiusLabel: UILabel!
    // text field to control fahrenheit temperature
    @IBOutlet var textField: UITextField!
    
    // used to format output in calsius label
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    // current value inside textField (when it changes update the celsius label)
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusValue()
        }
    }
    
    // current value inside calciusLabel
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    // when the view loads have the text automatically calculated
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusValue()
        
        print("ConversionViewController loaded its view")
    }
    
    // SILVER: makes background color black if nighttime (8pm on)
    override func viewWillAppear(_ animated: Bool) {
        let hour = Calendar.current.component(.hour, from: Date())
        let morning = 7
        let night = 22

        if hour > night || hour < morning {
            self.view.backgroundColor = UIColor.darkGray
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    // action provided in Main.storyboard. when editing text convert the values
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        // this uses numberFormatter.number(from: text) instead of Double(text) because of the locale might use a , instead of a .
        if let text = textField.text, let value = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: value.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    // dismiss keyboard when you tap the background (UITapGesture put into the view)
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    // returns true if it allows change
    // if there is an existing decimal and there is a decimal in the replacement text, block it
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let decimalSeperator = local.decimalSeparator ?? "."
        // BRONZE: checks to see if the string has any letters and if it is not nil it will block it
        let isLetter = string.rangeOfCharacter(from: CharacterSet.letters) != nil
        let isDecimal = textField.text?.range(of: decimalSeperator) != nil
        let hasDecimal = string.range(of: decimalSeperator) != nil
        
        // only cancel alpha replacement if it is not an alphabetic chacter AND is not a decimal
        if isDecimal && hasDecimal || isLetter {
            return false
        } else {
            return true
        }
     
    }
    
    // updates the celsius label (if it is a number, format and set the text; if not, set it to ???)
    func updateCelsiusValue() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
}
