# Chapter 10 - UITableView and UITableViewController

## Recap

* model: holds data and knows nothing about the UI
* view: visible to the user and knows nothing about model objects
* controller: keeps the UI and the model objects in sync and controls the flow of the application

## UITableViewController

* UITableView does not handle logic/data
* It needs a view controller to set appearance, a data source to populate it with data (# of rows, item at row, etc) as a ```dataSource``` that conforms to UITableViewDataSource, and a delegate to handle events UITableViewDelegate
* UITableViewController = view controller, dataSource, and delegate
* Its root view is always an instance of UITableView
* usually like this: ```class CustomTable: UITableViewController, UITableViewDataSource, UITableViewDelegate```
* To have the table view not overlap the status bar look at viewDidLoad


## Initializers

* Item class must inherit from NSObject like views do
* designated init = primary init for a class (every class must have one) that ensures all properties in the class have a value (after it calls the designated initializer for super
* convenience init = helper inits that calls another init on the same class marked convenience
* example: the designated init will be init(name:age) whereas the convenience init will be init(random: Bool) which will randomly generate a person
* @discardResult means that the user does not have to use the return

## UITableViewDataSource

* To conform to, you must implement how many rows there are and what item will go to what row

## UITableViewCell

* Each row of a table view is a view which are instances of UITableViewCell
* One of the required functions of UITableViewDataSource is to return one of these
* There is contentView (that makes up the contents) and an accessory view like a checkmark (default is UITableViewCellAccessoryType.none)
* ```contentView``` has three subclasses of its own: 2 UILabel (detailTextLabel, and textLabel) and a UIImageView (called imageView)
* Each cell also has a UITableViewCellStyle that determines which subviews are used and their position (.default, .subtitle, .value1, .value2)
* Instead of creating thousands as you go, they are put into a pool for reuse
* This creates the need for the reuseIdentifer, which is typically the name of the cell class
* To reuse cells, you give an identifier that says "give me back the cell that is this specific class" which will create a new one if there are none in the pool (set the identifier inside storyboard)
* Then use tableView.dequeueReusableCell(withIdentifer:"from inside storyboard)

## IndexPath

* Has 2 parts: section and row
* This is because UITableView has sections (contacts has A,B,C,etc sections)
* The default table view has only 1 section so for now only worry about row
