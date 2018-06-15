# Chapter 6 - Programmatic Views

## Programmatic Constraints

* A UISegmentedControl allows the user to choose between a set of options for the map (standard, hybrid, satelitte)
* Sometimes you must set the default translatesAutoresizingMarkIntoContraints to false because it can mess with contraints we set
* Anchors are properties on a view that set attributes (like settings two constraints to the same leading anchor)
* Top layout guides and bottom layout guides mark the extend to where views are visable. A view has a safeLayoutGuide where the topConstraint is set to under the status bar (safe from obstruction)
* You can set values yourself, but it is better to use anchors set by the view controller
Example:

imageView.width = 1.5 * imageView.height + 0
or
item.attribute (relatedBy) multiplier * toItem.attibute + constant
NSLayoutConstraint(item: imageView,
attribute: .width,
relatedBy:.equal,
toItem: imageView,
attribute: .height
multiplier: 1.5
constant: 0)

## Progromatic Controls

* UISegmentedControl implements UIControl so you can do things like when it is touched  (.touchUpInside, .touchDown, .editingChanged--like for the UITextField, etc)
* UIControl has a addTarget to set what happens for certain click types
