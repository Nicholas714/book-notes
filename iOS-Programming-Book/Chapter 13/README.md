# Chapter 13 - Stack Views

## UIStackView

* A stack view is an instance of UIStackView that allows you to create a verticle or horizontal layout that is easy to lay out and manages most of the constaints
* You can nest stack views with other stack views to create fast interfaces
* When you place a view in a UIStackView, you will have red lines to solve by auto layout or by a property
* One way would be by using implicit constraints OR by setting the distrobution to something like "Fill equally"
* Another powerful feature is nesting stack view, like a label and a input field inside a root stack view
* Change spacing to make views less squished (you will notice the one with the lower compression will shrink)

## Segues

* A segue moves another view controller's view onto the screen and is represented by an instance of UIStoryboardSegue (each has its own style, action item, and identifer)
* Style = how the view controller will be presented, action item = the view object in the storyboard file that triggers the segue, identifer = used to access the segue
* This is also used when passing data around. For example, when you click a ItemCell, you want the DetailViewController that will popup to have a connection to the Item that was clicked
* You will use prepare(for:segue:) where sender is what was clicked and segue is the segue (so you can check the identifer of the segue and then pull information from the sender)
* The UIStoryboardSegue itself gives three pieces of information: the source view controller, the destination view controller, and the identifer of the segue (this helps to identify certain segues)

## Implicit constraints

* If you do not specify constaints for width and height, the view will calculate its width or height from its intrinsic content size. To do this, it uses the content hugging priorities and its content compression resistance priority (number from 0-1000 where 1000 means it cannot get bigger than its intrinsic content size on that dimension)
* For example, 2 labels side to side and then the width increases. Which box will get bigger? it does not know so it puts red lines the "stronger" the rubber bands (0-1000) the less it will move
* Now for content compression resistance priorities: determines how much a view resists getting smaller than its intrinsic content size.
* What happens now if the width decreases? 2 labels are next to eachother, which one will shrink? The view with greater hugging # will compress more

## Shortcuts

* Option-click on a class/storyboard to open side by side - use this for connecting items (remeber: bad connections create crashes so make sure everything is hooked up correctly or remove it)
* In a case statement, inclide ? after the case condition?: to show it is a optional string
* preconditionFailure(message) is to catch unexpceted issue that would crash the application (where if a programmer forgot to set the identifier/case it)
