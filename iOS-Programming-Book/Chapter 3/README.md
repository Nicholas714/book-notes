# Chapter 3 - Views and the View Hierarchy

## Notes

### Hierarchy 

* Every application has a single UIWindow that is a container for everything
* An example hierarchy looks like: UIWindow -> UIView -> 5 UI Buttons
* Once the view is created, it is rendered
* It renders by creating a layer of itself, which is like a bitmap image (CALayer)
* After each layer is created, it is put together onto the screen 
* This means there are 2 main components of a view, the layers to draw itself and the views to handle events 

### Views and frames

* A view is created with a frame which is created with a size and position relative to super view (a rectangle)
* The grid system starts at (0,0) in the top left, this means all views are placed with the origin at the rectangle’s top left 
* So for example, if you place it at (30,30) the top left of that frame is 30,30 and the bottom right can be calculated by adding width/height to it
* So if you put a view inside a view it will be only 30 points under and 30 points left relative to that top view 
* Everything is in a point, not a pixel (for different resolutions) this is important because a retina iPhone has 3 pixels per point for example while an old one has only 1 pixel per point but still looks the same

### Constraints

* See Page 60 for AutoLayout tour
* Use leading/trailing over left/right for languages that read from left/right to right/left 
* Frame includes whole entire view while alignment rectangle includes only the alignment view 
* Intrinsic content size is the size a view “wants” to be (higher font = bigger width/height)

### Shotcuts

* Command-= after you select a view in interface builder will resize it to exactly its contents size (Editor > Size to fit)
