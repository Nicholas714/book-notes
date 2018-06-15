# Chapter 16 - Saving, Loading, and Application States

## Archiving

* Archiving involves recording an object's properties and saving them to the file system
* Unarchiving involves recreating the object from saved data
* Because views/view controllers depend on information provided by model objects, saving/loading object simply depends on saving model classes
* Inherit from NSCoding like ViewController does (where it has 1 new func called encode and 1 new init to decode just like the view controllers)
* func encode should set each property and the init should load each (with correct pairs)
* ***In Swift 4, there is no need to implmenet these methods. Simply inherit from Codable

## Application Sandbox

* A directory on the filesystem that is barricaded from the rest of the filesystem. The app must stay in its sandbox and no other application can access this sandbox
* Each sandbox has many directories: Documents/ - store all data here that will be backedup, Library/Caches/ - not get backed up but stores data like Documents/ (due to large storage or if it is stored in a web server) and system may delete if low on storage, Library/Preferences/ - handled by NSUserDefaults and is used to store settings for the app + is backed up to icloud, tmp/ - used temporarily during runtime and not backed up
* To save an item, there must be a URL (which in this case will store in Documents/) get it with ```FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!```
* in: has many options but it is shared with macOS so many do not work on iOS
* Call it in applicationDidEnterBackground
* To load, call it in the init of item store

## Application States and Transitions

* Not Running -> Application Launches which calls willFinishLaunchingWithOptions, didFinishLaunchingWithOptions, aplicationDidBecomeActive
* Active (home button/incoming call) -> applicationWillResignActive (and when dismissed) -> applicationDidBecomeActive
* applicationDidEnterBackground (phone call accepted/home) -> Background -> (after 10 seconds) Suspended which calls applicationWillEnterForeground and applicationDidBecomeActive when tapped or applicationWillTerminate when quit out of (and now back to not running)
* See Page 293
* All of this is handled in the... AppDelegate!

## Writing to the Filesystem with Data

* This is for saving the images instead of just Items (so saving everything inside ItemStore)
* Instead of storing the JPEG representation with a fubber we have a Data instance to store bytes of binary data which will be used to store images
* automic write puts it in the tmp and then moves it when complete to prevent data curroption
* if the image is not found, load it from the disk and put it into the cache if it is and when it is added add it to the cache and file system. this can be done with UIImageJPEGRepresentation, creating data and writing to a file, and then loading it with the path and providing the path into the UIImage constructor
* Much of I/O has trys and erros. But why an error instead of an optional? **Because an exception tells what kind of error (cannot create file because: no permission, already exists, path not found, etc) this error is stored inside error of the catch scope

## For the more curious

* Use ```print(#function)``` to print the function you are in. This is useful for testing when application states are fired.
* Copy Bundle resources packs it with the application (and even find it on the device by printing Bundle.main.bundlePath)
* To get a url from bundle use ```Bundle.main.applicationBundle.url(forResource: "myImage", ofType: "png")```
