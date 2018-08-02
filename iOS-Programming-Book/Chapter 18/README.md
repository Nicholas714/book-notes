# Chapter 18 - Touch Events and UIResponder

## Touch Events

* By being UIResponder you get touch events: touchesBegin(), touchesMoved(), touchesEnded(), and touchesCancelled()
* Passed in is a Set<UITouch>, which holds the touch data (a set because the view can have multi touch enabled)
* Until touchesEnded() or touchesCancelled() is called the touch instances are shared and passed around
* UITouch can be used as a key to a dictionary for persisting data between begin, move, end, and cancel
* @IBInspectable can be used to mark variables for change inside Interface Builder (usually call setNeedsDisplay in didSet)
* UIViewController, UIApplication, and UIWindow are all UIResponder dispite that they are not "touched." This is because it calls the next up UIResponder (its subviews)

## For the More Curious: UIControl

* UIControl is similar to UIResponder in that it handles touch events, but it creates more flexability with addTarget to specify the type of interaction (touchUpInside, touchUpOutside, etc)
* This is simply a overriden touchesEnded that will only call the target if they touched inside the frame, outside the frame, etc. 
