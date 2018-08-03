# Chapter 19 - UIGestureRecognizer and UIMenuController

## UIGestureRecognizor 

* Initialize gesture recognizors usually in init(aDecorder) or init(frame)
* TapGestureRecognizor has numberOfTapsRequired which sets how many taps to be called
* When a gesture recognizer is not called, it will not "eat up" the touchesBegin and call it, so use delaysTouchesBegin = true so it will not call touchesBegin until it is sure it is not a gesture
* If multiple gesture recognizors of same type being called at same time (such as a double tap and single tap, ex: singleTap singleTap doubleTap) use singleTap.require(toFail: doubleTap) to prevent both from being called   
* Discrete gestures (UITapGestureRegonizer) either happen or they don't, while continous (LongPress, Pan) are updated as they are acted upon
* Adding UIPanGestureRecognizer will cancel touches, use cancelsTouchesInView to change this 
* When translating, you can reset the current change value with gestureRecognizer.setTranslation
* Set delegate and override shouldRecognizeSimultaneouslyWith to enable multiple gestures 

## UIMenuController 

* Use UIMenuController.shared to gain access to it
* The view which is displaying it must be the first responder in order to handle the events (so call becomeFirstResponder)
* Must implement canBecomeFirstResponder for custom views  
