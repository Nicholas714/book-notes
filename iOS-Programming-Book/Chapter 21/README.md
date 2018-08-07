# Chapter 21 - Collection Views 

## Collection Views

* Uses data source design pattern to delegate to an object to provide data 
* A collection view is similar to a table view as it is an ordered collection of items, but instead of in a hierarchical list it has a layout object which controls how the information is displayed (strategy pattern, separates what changes using composition in a property (like flyBehavior), collectionView.layout)
* A built in example is UICollectionViewFlowLayout, which is built in, to present interesting photos in a scrollable grid 
* When using auto layout, select the collection view and the superview and pin to edges so the view will display under the top navigation bar blur 
* A good way to make a data source is a whole new class (PhotoDataSource), because if in the future you want the same data source with different photos, you can use this same exact class and just supply a different photos array 
* Must subclass from UICollectionViewDataSource and NSObject (so it can conform to NSObjectProtocol) and implement two required functions and set the collection view's dataSource to this object 
* UICollectionFlowLayout is only concrete layout provided by Apple, with properties such as scrollDirection (horizontally/vertically), minimumLineSpacing (spacing between rows), minimumInterItemSpacing (spacing between items in a row), itemSize (size of each photo item), sectionInset (margins used to lay out content for each section, left pad/rightpad)
* UICollectionViewCell is sub classed to provide a custom cell. For example, displays a UIActivityIndicatorView which will be stopped and the imageView updated when downloaded 
* Prototype cells are used to setup the cell in interface builder, and more can be added if you have different types of cells 
* Command+Shift + Click in interface builder shows all objects in case hard to click
* To prevent eating up data (as images are large), instead of populating all cells right away, populate them as they scroll using the willDisplay delegate method (delegates are tightly coupled so no need to add new class like the data source)
* UICollectionViewDelegate only has optional methods so it does not need to inherit NSObject
* Extensions are used to add protocol support and separate
* Equatable is template pattern, as == must be required to run index(of: Element)
* Scrolling up and down will end up in re-downloading, so images must be cached 