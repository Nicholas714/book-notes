# Chapter 12 - Subclassing UITableViewCell

## UITableViewCell

* When you need a cell that does more than textLabel, detailTextLabel, and imageView, you subclass from UITableViewCell to add more functionality
* To do this, when you subclass you add subviews to its contentView
* The reason why you add it to contentView and not the cell iteself is because the cell is sometimes resized (like when going in editing mode) where contentView will automatically resize (the width becomes smaller to fix the - and move button)
* You can edit a cell inside Main.storyboard (set the UITableViewCell under prototype cell to custom and set the type), then you just put on labels as if it was its own view and connect it to outlets in the cell

## Dynamic Cell Heights

* A fixed height of 65 is okay, but it should be determined by the content of the cell so everything changes automatically (based on contraints)
* use ```rowHeight = UITableViewAutomaticDimension and estimatedRowHeight = 65``` setting the estimated row helps with performance

## Dynamic Type

* Proces specifically designed text styles that are optimized for legibility so that text wize works with the size set inside Apple's font size setting scale
* To test, yuo set the iPhone to smalliest and biggest scale
* To get the values use ```UIFontTextStyle``` for example there is ```UIFontTextTextStyle.title1,title2,title3,headline```, etc. which is dynamic from what is set inside settings
* To do this, open Main.storyboard and set the font to "Text Styles - Body" for each label instead of a fixed font

## Responding to user changes

* Now someone can change the text size, but you want the app to take this change without having to start
* awakeFromNib gets called after it is loaded from an archive (like a storyboard file) when using task switcher (see awakeFromNib in ItemCell.swift) using ```label.adjustsFontForContentSizeCategory = true```

