# Chapter 11 - Editing UITableView

## Editing a UITableView

* Has a property called editing, which when set the true will allow users to move the items around
* This is usually placed inside a header view with a "Edit" button (and also a table footer for under a section)
* A header is just a view dragged upon the UITableViewController
* To add something, use tableView.insertRows(at: [IndexPath], section: 0) where index path is the index from the store array
* To remove something use this, ```allItems.remove(at: allItems.index(of: item))```
* Call that method from the delegate method found that is called when an item is ment for removal (tableView(commit:forRowAt) with the UITableViewCellEditingStyle of .delete)
* Movement contolls automatically appear when you implmeent moveAtRow function

## Alerts

* Two types: action sheet (from buttom), alert (over screen)
* Use a UIAlertController to display it and set the messages
* You add actions with UIAlertAction and action.addAction so a closure is run when it is selected
* Last present the UIAlertController with present
