# Chapter 5 - View Controllers

## UIWindow

* Views manager the view hierchy and has one root UIView to put everything in
* UIWindow -> UIViewController (rootViewController) -> UIView (view) -> bunch of subclasses
* Each storyboard has one initial view controller (set in interface builder with box or programitcally)
* For example, in a Map view controller, you delete the root view and add in your own MapKitView
* This creates a problem: MapKit is not loaded in like when you use import UIKit. Even if you do import MapKit, it will remove it out because it is not used. So that is the reason why you need to manually include the framework in Xcode
* When a viewcontroller is set as the window's rootViewController, it gets added to the window's view heirchy all existing subviews are removed and new ones are loaded with AutoLayout
* Each application has one main interface (which you can edit under Deployment Info, which is set to Main.storyboard)

## UITabBarController

* Fast changing for in between view controlllers
* Keeps an array of view controllers with a tab bar at the bottom
* Embed In -> Tab Bar Controller
* All view controllers has a tabBarViewController

## Accessing Subviews ***

* Override viewDidLoad() is configuration only needs to be done once during the run of the app
* Override viewWillAppear if you need the configuration to be done each time the view controller's view appears onscreen

## Interacting with View Controllers and Their Views

* init(coder:) - called when view is loaded by storyboard (once)
* init(nibName:bundle) - called when it is created without storyboard (once)
* viewDidLoad() - configures views created (once)
* loadView() - create root view programically
* viewWillAppear() - called every time view is moved onscreen
