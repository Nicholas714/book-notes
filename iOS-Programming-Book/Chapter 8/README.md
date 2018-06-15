# Chapter 8 - Controlling Animations

## Animations

* 2 types of animations: block-based and commit/begin based
* Basic animation has a start value, end value, and time it should take to animate (TimeInterval is an alias for Double)
* This is easy with UIView.animate(forDuration:animation:)
* swap(&one,&two) is useful to swap two things

## Animating Constraints

* Every object can have an IBOutlet, including constraints
* After animating a constraint, the system needs to call layoutIfNeeded() to recalculate their positions
* However, when animating the width may change so you must call view.layoutIfNeeed to layout changes before

## Timing Functions

* The acceleration of of the animation is controlled by the Timing Function, which by default is ease-in/ease-out (constant acceleration)
* There are many different types, but you can set the specific one with options: [.curveLinear] (or whatever else you want)
* Why is this in an array? Because UIViewAnimationOptions confirms to the OptionSet protocol, which allows multiple values using an array
* This may be useful for setting the curve, setting interaction, repeating, and reversing at the same time: [.curveEaseInOut, allowsUserInteracgtion, .repeat, .autoReverse]