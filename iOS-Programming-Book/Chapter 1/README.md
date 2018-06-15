# Chapter 1 - A Simple iOS Application

## Model View Controller
Key concept in application architecture. In MVC, every instance is inside either a model layer, view layer or conroller layer

### Model Layer
Holds data (knows nothing about UI) and usually represent real world things, like objects.

For example, in Quiz there will be a model that holds information about the question and the answer. Or in an insurance app there will be an InsurancePolicy model class. Or in a Calculator there will be a model class that will provide structured computations.

### View Layer
Containts objects that are visable to the user. Buttons, sliders, text fields, etc.

### Controller layer
Where the application is managed. Syncs the view & model while configuring the view.
"And then?"
Click this button "And then?" have the model do something with the information

**Views and models do not interact.**

Example: I click a button that does +7. The view sends a message to controller that it was pressed. The controller asks the model to do +7 on the current value and sends back to the controller. The controller updates the label with the number +7.

### Interface Builder
* Command+R is the run shortcut
* IB in IBDesignable or IBOutlet stands for Interface Builder -- which used to be a seperate app from Xcode
* IBOutlets store a reference to an object
* IBAction is a method that gets triggered by a button
* Control+Drag or Right Click + Drag to make a connection
