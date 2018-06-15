# Chapter 14 - UINavigationController

## UINavigationController

* Example is seen inside the Settings app using a "drill-down interface" whereas a UITabBarController is useful for indepdentent interfaces like the App Store
* This maintains an array of view controllers (viewControllers) and the one at the top of the stack is presented (topViewController)
* The view attached to a UINavigationController has 2 subviews: UINavigationBar and the view of the topViewController
* To keep complicated designs simple, make each UIViewController its own little world
* To embed a view into a navigtion controller use Editor > Embed In > Navigation Controller
* This explains why it is important to use topLayoutGuide/safeArea when setting constraints: because if a UINavigatioNBar is added, the padding is simply increased so you do not have to change any constraints
* When popping off stack it calls viewWillDisapear(_:) and the one coming on will be viewWillAppear(_:) (always call super.method when using these in case it has stuff to do)

## Events & First Responder

* Many touch events can be called: UIButton touch, phone shake, etc. but this creates an issue....what if there is many buttons or many text fields, which is being clicked/typed in?
* This creates a need for firstResponder which means only 1 can be the first responder at a time so you can use the one which was recently clicked/ typed in. So it is like a flag, which points to which view currently has it. The event is only sent to that "flag" view
* For example, whena a UITextView is clicked, it becomes first responder which puts a keyboard on screen and sends all type events to that view. So to dismiss the keyboard it is as simple as resignFirstResponder()
* When you want the keyboard to dismiss when you press return, inherit from UITextFieldDelegate and override textFieldShouldReturn(_:) which gets called when you hit return on the keyboard (which returns true if it should be clicked/false if it should not)
* To connect these text views to the delegate, you can set view.delegate to them manually with their outlets, but it is much simplier with controll+dragging and selecting "Delegate"

## Dismissing by clicking screen

* Drag UITapGestureRecognizer onto the view (it will show up in the view controller dock)
* Drag this icon at the dock to the view controller handling it and make an action
* To end keyboard editing you can call resignFirstResponder for each text field, or simply view.endEditing(true
* When hitting "Back" the keyboard dismisses instantly. To fix this call this view.endEditing(true) method inside viewWillDissapear

## UINavigationBar

* Every UIViewController has a property of UINavigationItem (which is not a view and instead is used to populate the view)
* Set the title of the UIViewController UINavigationItem and then the UINavigationBar will look for the title to configure itself
* This is much better than using buttons like you can use nagivationItem.leftBarButtonItem = editBarItem and it will automatically include editing features
