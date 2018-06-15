# Chapter 4 - Text Input and Delegation

## Notes

### Keyboard attibutes

* They keyboard's apperence when clicking a UITextField is determined by a property called UITextInputTraits (for different keyboard input types: numbers, email, etc)
* When text fields are tapped, the method becomeFirstResponder() is called on it, which causes the keyboard to appear (to quit the keyboard, you use resignFirstResponder)
* A gesture regonizor is a subclass of that detects specific touchs and calls an action when it is detected (using this to call a method that will use resignFirstResponder when tapping the background)
* To do this, just drag a UITapGestureRecongizer, drag it to the view controller icon, and click on the function you want called
* Use Measurement<UnitTemperature> for converting temperatures
* Property observers (didSet, etc) are not called when changing from inside initializtion
* Use a NumberFormatter to customize the display of a number (many types: length, mass, energy, etc)

### Delegation

* Delegation is an object-oriented approach to callbacks - a function that is supplied in advance of an event and is called every time the event occurs
* First, you must conform to a protocol
* You can contorl+drag to view controller and click delege to set it as delege
* Type types of functions in delegete protocols, one that updates (didUpdateText) and one that asks if something should happen (shouldReplaceTextWithThis? true/false)
* Delegate protocols follow a naming convention of delegating class (UITextField) plus Delege = UITextFieldDelegate
Here is an example:
class UITextFieldDelege {
    optional func onPressDot()
}

UITextField {
    func updateWithNewText(text: String) {
        if (text.contains(".")) {
            this.delegate?.onPressDot()
      }
    }
}

class ViewControllerStuff: UIViewController: UITextFieldDelege {
    textField.delege = this
    
    onPressDot() {
       print("dot!")
    }
}
}
